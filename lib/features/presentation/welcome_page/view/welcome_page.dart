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
          //! BackGroundImage
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(ImageManger.kLogIn),
          ),
        ),
        child: Column(
          children: [
            //! Welcome Display Widget
            WelcomeDisplayWidget(),
            SizedBox(height: context.height * 0.080),
            //! Get Started
            CustomPrimaryButton(
              title: 'Get Started',
              horizontal: 56,
              onTap: () {
                context.router.push(SignupRoute());
              },
              titleColor: ColorManger.kWhite,
            ),

            SizedBox(height: context.height * 0.012),
            //! Login
            CustomPrimaryButton(
              title: 'Login',
              titleColor: ColorManger.kEucalyptus,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [ColorManger.k2, ColorManger.k1],
              ),
              border: Border.all(width: 2, color: ColorManger.kEucalyptus),
              horizontal: 56,
              onTap: () {
                context.router.push(LoginRoute());
              },
            ),
            SizedBox(height: context.height * 0.012),
            //! RichTextWidget
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
