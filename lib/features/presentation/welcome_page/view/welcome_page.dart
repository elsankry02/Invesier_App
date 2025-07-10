import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/custom_primary_button.dart';
import '../../../../core/components/custom_rich_text.dart';
import '../../../../core/constant/color_manger.dart';
import '../../../../core/constant/image_manger.dart';
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
            image: AssetImage(ImageManger.kOnBoarding),
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
                colors: [ColorManger.kEucalyptus, ColorManger.kTurquoiseBlue],
              ),
              borderColor: ColorManger.kTurquoiseBlue,
              radius: 60,
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 105,
                vertical: 15,
              ),
              margin: EdgeInsetsDirectional.symmetric(horizontal: 43),
              style: context.kTextTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: ColorManger.kWhite,
              ),
              onTap: () {
                context.router.push(SignupRoute());
              },
            ),

            SizedBox(height: context.height * 0.012),
            // Login
            CustomPrimaryButton(
              title: 'Login',

              borderColor: ColorManger.kEucalyptus,
              radius: 60,
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 130,
                vertical: 15,
              ),
              margin: EdgeInsetsDirectional.symmetric(horizontal: 43),
              style: context.kTextTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: ColorManger.kEucalyptus,
              ),
              onTap: () {
                context.router.push(LoginRoute());
              },
            ),
            SizedBox(height: context.height * 0.012),
            // RichTextWidget
            CustomRichText(
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
