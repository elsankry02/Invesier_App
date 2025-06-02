import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/components/custom_confirm_otp.dart';
import 'package:invesier/core/components/custom_icon_back.dart';
import 'package:invesier/core/components/custom_title_appbar.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/constant/image_manger.dart';

@RoutePage()
class LoginEmailConfirmOtpPage extends StatefulWidget {
  const LoginEmailConfirmOtpPage({super.key});

  @override
  State<LoginEmailConfirmOtpPage> createState() =>
      _LoginEmailConfirmOtpPageState();
}

class _LoginEmailConfirmOtpPageState extends State<LoginEmailConfirmOtpPage> {
  @override
  Widget build(BuildContext context) {
    final kTextTheme = Theme.of(context).textTheme;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(ImageManger.kLogIn2),
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              Row(
                children: [
                  //! CustomIconBack
                  CustomIconBack(),
                  Expanded(
                    //! CustomAppBar
                    child: CustomTitelAppBar(
                      kTextTheme: kTextTheme,
                      title: 'Confirm OTP',
                    ),
                  ),
                ],
              ),
              SizedBox(height: h * 0.023),
              //! Enter the OTP code sent your phone and Email
              RichText(
                text: TextSpan(
                  text:
                      'Enter the OTP code sent your phone number \nm.hassan@gmail.com.',
                  style: kTextTheme.titleSmall!.copyWith(
                    color: ColorManger.kBoulder,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: h * 0.040),
              CustomConfirmOTP(),
            ],
          ),
        ),
      ),
    );
  }
}
