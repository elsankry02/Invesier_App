import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/components/show_custom_top_snack_bar.dart';
import 'package:invesier/features/provider/post/resend_otp_provider.dart';

import '../../../../core/components/custom_contact_type_field.dart';
import '../../../../core/components/custom_outlined_button.dart';
import '../../../../core/components/custom_primary_button.dart';
import '../../../../core/components/custom_social_auth_button.dart';
import '../../../../core/components/custom_tap_richtext.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_enums.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/router/router.dart';

@RoutePage()
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<LoginPage> {
  final formKey = GlobalKey<FormState>();
  ContactType contactType = ContactType.phone;
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final pageController = PageController(initialPage: 1);

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    pageController.dispose();
    super.dispose();
  }

  Future<void> logIn() async {
    final notifier = ref.read(resendOtpProvider.notifier);
    final isPhone = contactType == ContactType.phone;
    await notifier.resendOtp(
      phonePrefix: "+20",
      authMethod: contactType.name,
      email: isPhone ? null : emailController.text.trim(),
      phone: isPhone ? phoneController.text.trim() : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(resendOtpProvider);
    ref.listen(resendOtpProvider, (_, state) {
      if (state is ResendOtpFailure) {
        showCustomErrorMessage(context, message: state.errMessage);
        return;
      }
      if (state is ResendOtpSuccess) {
        showCustomSuccessMessage(context, message: "OTP resent successfully");
        context.router.push(
          CustomVerifyOtpRoute(
            isLogin: true,
            contactType: contactType,
            emailController: emailController,
            phoneController: phoneController,
          ),
        );
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
              padding: EdgeInsets.symmetric(horizontal: 24),
              children: [
                // Welcome To Invesier!
                Text(
                  textAlign: TextAlign.center,
                  'Welcome To Invesier!',
                  style: context.kTextTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4),
                // Don't have an account?
                Center(
                  child: CustomTapRichText(
                    textSpanOne: "Don't have an account?",
                    textSpanTwo: ' Create an account ',
                    onTap: () {
                      context.router.replace(SignupRoute());
                    },
                  ),
                ),
                SizedBox(height: context.height * 0.024),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Email
                        CustomOutlinedButton(
                          title: 'Email',
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(26),
                            bottomLeft: Radius.circular(26),
                          ),
                          titleColor:
                              contactType == ContactType.email
                                  ? AppColors.kWhite
                                  : AppColors.kTurquoiseBlue,
                          color:
                              contactType == ContactType.email
                                  ? AppColors.kTurquoiseBlue
                                  : AppColors.kBackGround,
                          onTap: () {
                            setState(() {
                              contactType = ContactType.email;
                              pageController.animateToPage(
                                0,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            });
                          },
                        ),
                        // Phone
                        CustomOutlinedButton(
                          title: 'Phone',
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(26),
                            bottomRight: Radius.circular(26),
                          ),
                          titleColor:
                              contactType == ContactType.phone
                                  ? AppColors.kWhite
                                  : AppColors.kTurquoiseBlue,
                          color:
                              contactType == ContactType.phone
                                  ? AppColors.kTurquoiseBlue
                                  : AppColors.kCodGray,

                          onTap: () {
                            setState(() {
                              contactType = ContactType.phone;
                              pageController.animateToPage(
                                1,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: context.height * 0.047),
                    // PageView
                    SizedBox(
                      height: context.height * 0.150,
                      child: PageView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: pageController,
                        children: [
                          // Email
                          CustomContactTypeFieldWidget(
                            title: 'Email',
                            hintText: 'name@gmail.com',
                            tybeController: emailController,
                          ),
                          // Phone Number
                          CustomContactTypeFieldWidget(
                            title: 'Phone number',
                            hintText: '01050******',
                            tybeController: phoneController,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.height * 0.11),
                CustomSocialAuthButton(
                  onLoginWithGoogle: () {
                    showCustomErrorMessage(context, message: "COMING SOON");
                  },
                  onLoginWithApple: () {
                    showCustomErrorMessage(context, message: "COMING SOON");
                  },
                ),
                SizedBox(height: context.height * 0.057),
                // CustomPrimaryButton
                CustomPrimaryButton(
                  title: "Log in",
                  isLoading: state is ResendOtpLoading,
                  gradient: LinearGradient(
                    colors: [AppColors.kEucalyptus, AppColors.kTurquoiseBlue],
                  ),
                  borderColor: AppColors.kTurquoiseBlue,
                  padding: EdgeInsetsDirectional.symmetric(vertical: 13),
                  radius: 60,
                  style: context.kTextTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.kWhite,
                  ),
                  onTap: logIn,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
