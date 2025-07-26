import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/constant/enum_manger.dart';
import 'package:invesier/features/provider/post/verify_otp_provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../features/presentation/signup_page/widget/signup_rich_text_widget.dart';
import '../constant/color_manger.dart';
import '../extension/extension.dart';
import 'custom_icon_button.dart';
import 'custom_pinput_otp_widget.dart';
import 'custom_primary_button.dart';
import 'custom_title_appbar.dart';

@RoutePage()
class CustomConfirmOtpPage extends ConsumerStatefulWidget {
  final TextEditingController phoneController, emailController;
  final ContactType contactType;
  const CustomConfirmOtpPage(
    this.phoneController,
    this.emailController,
    this.contactType, {
    super.key,
  });
  @override
  ConsumerState<CustomConfirmOtpPage> createState() =>
      _CustomConfirmOtpPageState();
}

class _CustomConfirmOtpPageState extends ConsumerState<CustomConfirmOtpPage> {
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

  Future<void> verifyOtp() async {
    final notifier = ref.read(verifyOtpProvider.notifier);
    final isEmail = widget.contactType == ContactType.email;
    await notifier.verifyOtp(
      authMethod: widget.contactType.name,
      otp: "",
      email: isEmail ? widget.emailController.text : null,
      phone: isEmail ? null : widget.phoneController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final notifier = ref.read(verifyOtpProvider.notifier);
    final state = ref.watch(verifyOtpProvider);
    ref.listen(verifyOtpProvider, (_, state) {
      if (state is VerifyOtpFailuer) {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(message: state.errMassege),
        );
        return;
      }
      if (state is VerifyOtpSuccess) {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.success(message: "Success"),
        );
      }
    });
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
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: ColorManger.kWhite,
                      ),
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
                        text: 'Enter the OTP code sent ',
                        style: context.kTextTheme.titleSmall!.copyWith(
                          color: ColorManger.kBoulder,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: widget.contactType.name,
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
                  // isLoading: state is VerifyOtpLoading,
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
                  onTap: verifyOtp,
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
