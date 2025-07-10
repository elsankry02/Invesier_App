import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/custom_icon_button.dart';
import '../../../../core/components/custom_pinput_otp_widget.dart';
import '../../../../core/components/custom_primary_button.dart';
import '../../../../core/components/custom_title_appbar.dart';
import '../../../../core/constant/color_manger.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/router/router.dart';
import '../widget/signup_rich_text_widget.dart';

@RoutePage()
class SignUpConfirmOtpPage extends StatefulWidget {
  const SignUpConfirmOtpPage({super.key});

  @override
  State<SignUpConfirmOtpPage> createState() => _SignUpConfirmOtpPageState();
}

class _SignUpConfirmOtpPageState extends State<SignUpConfirmOtpPage> {
  Timer? timer;
  int secondsRemaining = 60;
  final formKey = GlobalKey<FormState>();
  final pinController = TextEditingController();

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    timer?.cancel();
    secondsRemaining = 60;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void resendCode() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('A new code has been sent')));
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorManger.k2, ColorManger.k1],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: SafeArea(
          child: Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                Row(
                  children: [
                    // Custom Icon Back
                    CustomIconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        context.router.maybePop();
                      },
                    ),
                    // CustomTitelAppBar
                    Expanded(
                      child: CustomTitelAppBar(
                        title: "Verify your phone number",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.height * 0.020),
                // Enter the OTP code sent your phone number
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Enter the OTP code sent your phone number\n',
                        style: context.kTextTheme.titleSmall!.copyWith(
                          color: ColorManger.kBoulder,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: '01204306044',
                        style: context.kTextTheme.titleMedium!.copyWith(
                          color: ColorManger.kBoulder,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.height * 0.040),
                // Signup Pinput Widget
                CustomPinPutOTPWidget(
                  onChanged: (value) {},
                  validator: (value) {
                    if (value!.length < 6) {
                      return 'Please enter the full 6-digit code';
                    }
                    return null;
                  },
                ),
                SizedBox(height: context.height * 0.196),
                // IF
                secondsRemaining > 0
                    ? Text(
                      textAlign: TextAlign.center,
                      'Resend OTP ($secondsRemaining seconds)',
                      style: context.kTextTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    )
                    : TextButton(
                      onPressed: resendCode,
                      child: Text(
                        "Resend",
                        style: context.kTextTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                SizedBox(height: context.height * 0.015),
                // Verify code
                CustomPrimaryButton(
                  title: 'Verify code',

                  gradient: LinearGradient(
                    colors: [
                      ColorManger.kEucalyptus,
                      ColorManger.kTurquoiseBlue,
                    ],
                  ),
                  borderColor: ColorManger.kTurquoiseBlue,
                  radius: 60,
                  padding: EdgeInsetsDirectional.symmetric(vertical: 13),
                  style: context.kTextTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorManger.kWhite,
                  ),
                  onTap: () {
                    context.router.replace(BottomNavigationBarRoute());
                  },
                ),
                SizedBox(height: context.height * 0.015),
                // SignUp Rich Text
                SignUpRichTextWidget(
                  termsOfUseOnTap: () {},
                  privacyPolicyOnTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
