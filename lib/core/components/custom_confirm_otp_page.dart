import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/features/provider/post/verify_otp_provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../features/presentation/signup_page/widget/signup_rich_text_widget.dart';
import '../constant/app_colors.dart';
import '../constant/app_enums.dart';
import '../extension/extension.dart';
import '../router/router.dart';
import 'custom_icon_button.dart';
import 'custom_pinput_widget.dart';
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
  final pinPutController = TextEditingController();

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    pinPutController.dispose();
    timer?.cancel();
    super.dispose();
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
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        backgroundColor: AppColors.kDarkenText,
        message: "A new code has been sent",
      ),
    );
    startTimer();
  }

  Future<void> verifyOtp() async {
    final notifier = ref.read(verifyOtpProvider.notifier);
    final isEmail = widget.contactType == ContactType.email;
    await notifier.verifyOtp(
      authMethod: widget.contactType.name,
      otp: pinPutController.text,
      email: isEmail ? widget.emailController.text : null,
      phone: isEmail ? null : widget.phoneController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final notifier = ref.read(verifyOtpProvider.notifier);
    final state = ref.watch(verifyOtpProvider);
    ref.listen(verifyOtpProvider, (_, state) {
      if (state is VerifyOtpFailure) {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(message: state.errMessage),
        );
        log(state.errMessage);
        return;
      }
      if (state is VerifyOtpSuccess) {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.success(message: "Authentication successful"),
        );
        context.router.replace(BottomNavigationBarRoute());
      }
    });
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.kTwo, AppColors.kOne],
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
                      icon: Icon(Icons.arrow_back_ios, color: AppColors.kWhite),
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
                          color: AppColors.kBoulder,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text:
                            widget.contactType == ContactType.email
                                ? widget.emailController.text
                                : widget.phoneController.text,
                        style: context.kTextTheme.titleMedium!.copyWith(
                          color: AppColors.kBoulder,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.height * 0.040),
                // Signup Pinput Widget
                CustomPinPutWidget(
                  pinPutController: pinPutController,
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
                  isLoading: state is VerifyOtpLoading,
                  gradient: LinearGradient(
                    colors: [AppColors.kEucalyptus, AppColors.kTurquoiseBlue],
                  ),
                  borderColor: AppColors.kTurquoiseBlue,
                  radius: 60,
                  padding: EdgeInsetsDirectional.symmetric(vertical: 13),
                  style: context.kTextTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.kWhite,
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
