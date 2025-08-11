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
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // BackGroundImage
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppImages.kOnBoarding),
          ),
        ),
        child: Column(
          children: [
            // Welcome Display Widget
            WelcomeDisplayWidget(),
            SizedBox(height: context.height * 0.080),
            // Get Started
            CustomPrimaryButton(
              title: 'Get Started',

              gradient: LinearGradient(
                colors: [AppColors.kEucalyptus, AppColors.kTurquoiseBlue],
              ),
              borderRadius: BorderRadius.circular(60),
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 105,
                vertical: 15,
              ),
              margin: EdgeInsetsDirectional.symmetric(horizontal: 43),
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
              title: 'Login',
              border: BoxBorder.all(color: AppColors.kEucalyptus),
              borderRadius: BorderRadius.circular(60),
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 130,
                vertical: 15,
              ),
              margin: EdgeInsetsDirectional.symmetric(horizontal: 43),
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
              textSpanOne: 'Already have an account?',
              textSpanTwo: ' Sign up',
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
