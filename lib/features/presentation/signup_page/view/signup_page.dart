import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/components/show_custom_top_snack_bar.dart';
import '../../../provider/post/register_new_user_provider.dart';

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
class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});
  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
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

  Future<void> register() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    final notifier = ref.read(registerNewUserProvider.notifier);
    final isEmail = contactType == ContactType.email;
    await notifier.registerNewUser(
      prefix: "+20",
      authMethod: contactType.name,
      email: isEmail ? emailController.text.trim() : null,
      phone: isEmail ? null : phoneController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(registerNewUserProvider);
    ref.listen(registerNewUserProvider, (_, state) {
      if (state is RegisterNewUserFailure) {
        showCustomErrorMessage(context, message: state.errMessage);
        return;
      }
      if (state is RegisterNewUserSuccess) {
        showCustomSuccessMessage(
          context,
          message: "OTP sent successfully. Please verify to continue.",
        );
        context.router.push(
          CustomVerifyOtpRoute(
            isLogin: false,
            phoneController: phoneController,
            emailController: emailController,
            contactType: contactType,
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
                // Create an account
                Text(
                  textAlign: TextAlign.center,
                  'Create an account',
                  style: context.kTextTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4),
                // Rich Text
                Center(
                  child: CustomTapRichText(
                    textSpanOne: 'Already have an account?',
                    textSpanTwo: ' Log in',
                    onTap: () {
                      // Navigate to Login
                      context.router.replace(LoginRoute());
                    },
                  ),
                ),
                SizedBox(height: context.height * 0.024),
                Column(
                  children: [
                    //  Type
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //  Email
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
                    SizedBox(
                      height: context.height * 0.150,
                      // PageView
                      child: PageView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: pageController,
                        children: [
                          // Email
                          CustomContactTypeFieldWidget(
                            title: 'Email',
                            hintText: 'name@gmail.com',
                            keyboardType: TextInputType.emailAddress,
                            tybeController: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a valid Email';
                              } else if (!value.contains('@')) {
                                return 'Email must contain @';
                              }
                              return null;
                            },
                          ),
                          // Phone Number
                          CustomContactTypeFieldWidget(
                            title: 'Phone number',
                            hintText: '01204******',
                            keyboardType: TextInputType.number,
                            tybeController: phoneController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter a valid phone number";
                              } else if (value.length < 11) {
                                return 'Phone number must be at least 11 digits';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.height * 0.11),
                // Custom Social Auth Buttons
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
                  title: "Create an account",
                  isLoading: state is RegisterNewUserLoading,
                  backGroundColor: AppColors.kTurquoiseBlue,
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
                  onTap: register,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
