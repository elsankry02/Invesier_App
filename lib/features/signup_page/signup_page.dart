import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/components/custom_or_connect_with.dart';
import 'package:invesier/components/custom_primary_button.dart';
import 'package:invesier/components/custom_rich_text.dart';
import 'package:invesier/constant/color_manger.dart';
import 'package:invesier/constant/image_manger.dart';
import 'package:invesier/constant/svg_manger.dart';
import 'package:invesier/features/signup_page/widget/login_options_widget.dart';
import 'package:invesier/router/router.dart';

@RoutePage()
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formkey = GlobalKey<FormState>();
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
        child: Form(
          key: formkey,
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
              //! LoginOptionsWidget
              LoginOptionsWidget(
                //! email Validator
                emailValidator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a valid email';
                  } else {
                    return 'valid';
                  }
                },
                //! phoneValidator
                phoneValidator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a valid phone number.';
                  } else {
                    return 'valid';
                  }
                },
              ),
              SizedBox(height: h * 0.11),
              Column(
                children: [
                  //! Or connect with
                  Text(
                    'Or connect with',
                    style: kTextTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //! Google
                      CustomOrConnectWith(
                        onTap: () {},
                        assetName: SvgManger.kGoogleic,
                      ),
                      SizedBox(width: 8),
                      //! Vector
                      CustomOrConnectWith(
                        onTap: () {},
                        assetName: SvgManger.kVector,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: h * 0.057),
              //! CustomPrimaryButton
              CustomPrimaryButton(
                backgroundColor: ColorManger.kTurquoiseBlue,
                titleColor: ColorManger.kWhite,
                title: 'Create an account',
                horizontal: 17,
                onTap: () {
                  formkey.currentState!.validate();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
