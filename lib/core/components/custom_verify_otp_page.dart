import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/components/custom_appbar_title.dart';

import '../../features/presentation/signup_page/widget/signup_rich_text_widget.dart';
import '../../features/provider/post/verify_otp_provider.dart';
import '../constant/app_colors.dart';
import '../constant/app_enums.dart';
import '../extension/extension.dart';
import '../router/router.dart';
import 'custom_icon_button.dart';
import 'custom_otp_code_field.dart';
import 'custom_primary_button.dart';
import 'show_custom_top_snack_bar.dart';

@RoutePage()
class CustomVerifyOtpPage extends ConsumerStatefulWidget {
  final TextEditingController phoneController, emailController;
  final bool isLogin;
  final ContactType contactType;
  const CustomVerifyOtpPage(
    this.phoneController,
    this.emailController,
    this.contactType, {
    required this.isLogin,
    super.key,
  });
  @override
  ConsumerState<CustomVerifyOtpPage> createState() =>
      _CustomConfirmOtpPageState();
}

class _CustomConfirmOtpPageState extends ConsumerState<CustomVerifyOtpPage> {
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
    showCustomSuccessMessage(context, message: "A new code has been sent");
    startTimer();
  }

  Future<void> verifyOtp() async {
    if (!formKey.currentState!.validate()) return;
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
    final state = ref.watch(verifyOtpProvider);
    ref.listen(verifyOtpProvider, (_, state) {
      if (state is VerifyOtpFailure) {
        showCustomErrorMessage(context, message: state.errMessage);
        return;
      }
      if (state is VerifyOtpSuccess) {
        final isLogin = widget.isLogin;
        if (isLogin == true) {
          context.router.replace(MainNavigationRoute());
          showCustomSuccessMessage(
            context,
            message: "OTP verified successfully",
          );
        } else {
          context.router.push(CompleteProfileRoute());
          showCustomSuccessMessage(
            context,
            message: "Authentication successful",
          );
        }
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
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // CustomTitelAppBar
                    CustomAppBarTitle(title: "Verify your phone number"),
                    // Custom Icon Back
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomIconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.kWhite,
                        ),
                        onPressed: () {
                          context.router.maybePop();
                        },
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
                CustomOtpCodeField(
                  pinPutController: pinPutController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter the OTP";
                    } else if (value.length < 6) {
                      return "OTP must be 6 digits";
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
                  isLoading: state is VerifyOtpLoading,
                  gradient: LinearGradient(
                    colors: [AppColors.kEucalyptus, AppColors.kTurquoiseBlue],
                  ),
                  border: Border.all(color: AppColors.kTurquoiseBlue),
                  borderRadius: BorderRadius.circular(60),
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
