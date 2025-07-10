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

@RoutePage()
class LoginPhoneConfirmOtpPage extends StatefulWidget {
  const LoginPhoneConfirmOtpPage({super.key});

  @override
  State<LoginPhoneConfirmOtpPage> createState() =>
      _LoginPhoneConfirmOtpPageState();
}

class _LoginPhoneConfirmOtpPageState extends State<LoginPhoneConfirmOtpPage> {
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
    secondsRemaining = 60;
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (secondsRemaining > 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        t.cancel();
      }
    });
  }

  void resendCode() {
    startTimer();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('A new code has been sent')));
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
                    Expanded(
                      // CustomAppBar
                      child: CustomTitelAppBar(title: 'Confirm OTP'),
                    ),
                  ],
                ),
                SizedBox(height: context.height * 0.023),
                // Enter the OTP code sent your phone and Email
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
                      // mobile numder
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
                // Custom PinPut OTP Widget
                CustomPinPutOTPWidget(
                  onChanged: (value) {},
                  validator: (value) {
                    return null;
                  },
                ),
                SizedBox(height: context.height * 0.016),
                secondsRemaining > 0
                    ?
                    // If you didn't receive the code
                    Text(
                      textAlign: TextAlign.center,
                      "If you didn't receive the code in 00:$secondsRemaining",
                      style: context.kTextTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    )
                    // resendCode
                    : TextButton(
                      onPressed: resendCode,
                      child: Text(
                        "Resend",
                        style: context.kTextTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                SizedBox(height: context.height * 0.191),
                // Submit
                CustomPrimaryButton(
                  title: 'Submit',
                  gradient: LinearGradient(
                    colors: [
                      ColorManger.kEucalyptus,
                      ColorManger.kTurquoiseBlue,
                    ],
                  ),
                  borderColor: ColorManger.kTurquoiseBlue,
                  paddingVertical: 13,
                  marginHorizontal: 0,
                  paddingHorizontal: 0,
                  radius: 60,
                  style: context.kTextTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorManger.kEucalyptus,
                  ),
                  onTap: () {
                    context.router.push(BottomNavigationBarRoute());
                    if (formKey.currentState!.validate()) {}
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
