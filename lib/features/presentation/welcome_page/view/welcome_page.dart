import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/custom_primary_button.dart';
import '../../../../core/components/custom_tap_richtext.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_images.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/router/router.dart';
import '../widget/welcome_display_widget.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // BackGroundImage
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppImages.kOnBoarding),
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Welcome Display Widget
            WelcomeDisplayWidget(),
            SizedBox(height: context.height * 0.050),
            // Get Started
            CustomPrimaryButton(
              title: local.getstarted,

              gradient: LinearGradient(
                colors: [AppColors.kEucalyptus, AppColors.kTurquoiseBlue],
              ),
              borderRadius: BorderRadius.circular(60),
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: context.width * 0.105,
                vertical: context.height * 0.015,
              ),
              margin: EdgeInsetsDirectional.symmetric(
                horizontal: context.height * 0.043,
              ),
              style: context.kTextTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.kWhite,
              ),
              onTap: () {
                context.router.push(SignupRoute());
              },
            ),

            SizedBox(height: context.height * 0.012),
            // Login
            CustomPrimaryButton(
              title: local.login,
              border: BoxBorder.all(color: AppColors.kEucalyptus),
              borderRadius: BorderRadius.circular(60),
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: context.width * 0.100,
                vertical: context.height * 0.015,
              ),
              margin: EdgeInsetsDirectional.symmetric(
                horizontal: context.height * 0.043,
              ),
              style: context.kTextTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.kEucalyptus,
              ),
              onTap: () {
                context.router.push(LoginRoute());
              },
            ),
            SizedBox(height: context.height * 0.012),
            // RichTextWidget
            CustomTapRichText(
              textSpanOne: local.donthaveanaccount,
              textSpanTwo: local.signup,
              onTap: () {
                context.router.push(SignupRoute());
              },
            ), 
          ],
        ),
      ),
    );
  }
}
