import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/custom_confirm_otp.dart';
import '../../../../core/components/custom_icon_back.dart';
import '../../../../core/components/custom_primary_button.dart';
import '../../../../core/components/custom_title_appbar.dart';
import '../../../../core/constant/color_manger.dart';
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
    final kTextTheme = Theme.of(context).textTheme;
    final h = MediaQuery.of(context).size.height;
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
                      'Enter the OTP code sent your phone number \n01078653878.',
                  style: kTextTheme.titleSmall!.copyWith(
                    color: ColorManger.kBoulder,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: h * 0.040),
              //! CustomConfirmOTP
              CustomConfirmOTP(
                onChanged: (value) {},
                validator: (value) {
                  if (value!.length < 6) {
                    return 'Please enter the full 6-digit code';
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
                  : TextButton(
                    onPressed: resendCode,
                    child: Text(
                      "Resend",
                      style: kTextTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
              SizedBox(height: h * 0.191),
              //! Submit
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
    );
  }
}
