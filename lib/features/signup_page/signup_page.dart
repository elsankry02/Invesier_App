import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/components/custom_enum_login.dart';
import 'package:invesier/components/custom_rich_text.dart';
import 'package:invesier/constant/image_manger.dart';
import 'package:invesier/router/router.dart';

@RoutePage()
class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final kTextTheme = Theme.of(context).textTheme;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          //! Image
          image: DecorationImage(
            fit: BoxFit.cover,

            image: AssetImage(ImageManger.kLogIn2),
          ),
        ),
        child: ListView(
          children: [
            //! Create an account
            Text(
              textAlign: TextAlign.center,
              'Create an account',
              style: kTextTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 4),
            //! Rich Text
            Center(
              child: CustomRichText(
                textSpanOne: 'Already have an account?',
                textSpanTwo: ' Log in',
                onTap: () {
                  //! Navigate to Login
                  context.router.replace(LoginRoute());
                },
              ),
            ),
            SizedBox(height: h * 0.024),
            CustomEnumLogin(),
          ],
        ),
      ),
    );
  }
}
