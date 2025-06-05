import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../core/extension/extension.dart';

import '../../../../core/components/custom_confirm_otp.dart';
import '../../../../core/components/custom_icon_back.dart';
import '../../../../core/components/custom_primary_button.dart';
import '../../../../core/components/custom_title_appbar.dart';
import '../../../../core/constant/color_manger.dart';
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
      backgroundColor: ColorManger.kBackGround,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              Row(
                children: [
                  //! CustomIconBack
                  CustomIconBack(),
                  //! CustomTitelAppBar
                  Expanded(
                    child: CustomTitelAppBar(title: "Verify your phone number"),
                  ),
                ],
              ),
              SizedBox(height: context.h * 0.020),
              //! Enter the OTP code sent your phone number
              RichText(
                text: TextSpan(
                  text:
                      'Enter the OTP code sent your phone number \n01078653878.',
                  style: context.kTextTheme.titleSmall!.copyWith(
                    color: ColorManger.kBoulder,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: context.h * 0.040),
              //! Signup Pinput Widget
              CustomConfirmOTP(
                onChanged: (value) {},
                validator: (value) {
                  if (value!.length < 6) {
                    return 'Please enter the full 6-digit code';
                  }
                  return null;
                },
              ),
              SizedBox(height: context.h * 0.196),
              //! IF
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
              SizedBox(height: context.h * 0.015),
              //! Verify code
              CustomPrimaryButton(
                title: 'Verify code',
                titleColor: ColorManger.kWhite,

                horizontal: 0,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    //! Navigate to ###########
                    context.router.replace(WelcomeRoute());
                  }
                },
              ),
              SizedBox(height: context.h * 0.015),
              //! SignUp Rich Text
              SignUpRichTextWidget(
                termsOfUseOnTap: () {},
                privacyPolicyOnTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
