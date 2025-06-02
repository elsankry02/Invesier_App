import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/components/custom_confirm_otp.dart';
import 'package:invesier/core/components/custom_icon_back.dart';
import 'package:invesier/core/components/custom_primary_button.dart';
import 'package:invesier/core/components/custom_title_appbar.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/constant/image_manger.dart';
import 'package:invesier/core/router/router.dart';

@RoutePage()
class LoginEmailConfirmOtpPage extends StatefulWidget {
  const LoginEmailConfirmOtpPage({super.key});

  @override
  State<LoginEmailConfirmOtpPage> createState() =>
      _LoginEmailConfirmOtpPageState();
}

class _LoginEmailConfirmOtpPageState extends State<LoginEmailConfirmOtpPage> {
  final formKey = GlobalKey<FormState>();
  Timer? timer;
  int secondsRemaining = 60;
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    timer?.cancel();
    Timer.periodic(Duration(seconds: 1), (t) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        timer?.cancel();
      }
    });
  }

  void resendCode() {
    startTimer();
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
          child: Form(
            key: formKey,
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
                CustomConfirmOTP(
                  onChanged: (value) {},
                  validator: (value) {
                    if (value!.length < 6) {
                      return "Please enter the full 6-digit code";
                    }
                    return null;
                  },
                ),
                SizedBox(height: h * 0.016),

                secondsRemaining > 0
                    ?
                    //! If you didn't receive the code
                    Text(
                      textAlign: TextAlign.center,
                      "If you didn't receive the code in 00:$secondsRemaining",
                      style: kTextTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    )
                    //! resendCode
                    : GestureDetector(
                      onTap: () {
                        resendCode();
                      },
                      child: Text(
                        textAlign: TextAlign.center,
                        "Resend",
                        style: kTextTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                SizedBox(height: h * 0.191),
                CustomPrimaryButton(
                  titleColor: ColorManger.kWhite,
                  title: 'Submit',
                  horizontal: 0,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      context.router.replace(WelcomeRoute());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
