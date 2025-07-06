import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/custom_button_style_enum.dart';
import '../../../../core/components/custom_primary_button.dart';
import '../../../../core/components/custom_rich_text.dart';
import '../../../../core/components/custom_social_auth_buttons.dart';
import '../../../../core/constant/color_manger.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/router/router.dart';
import '../widget/contact_email_widget.dart';
import '../widget/contact_phone_widget.dart';

enum ContactType { email, phone }

@RoutePage()
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
              padding: EdgeInsets.symmetric(horizontal: 24),
              children: [
                //! Create an account
                Text(
                  textAlign: TextAlign.center,
                  'Create an account',
                  style: context.kTextTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4),
                //! Rich Text
                Center(
                  child: CustomRichText(
                    textSpanOne: 'Already have an account?',
                    textSpanTwo: ' Log in',
                    onTap: () {
                      //! Navigate to Login
                      context.router.replace(LoginRoute());
                    },
                  ),
                ),
                SizedBox(height: context.height * 0.024),
                Column(
                  children: [
                    //! Contact Type
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //! CustomButton Email
                        CustomButtonStyleEnum(
                          title: 'Email',
                          topLeft: 26,
                          bottomLeft: 26,
                          titleColor:
                              contactType == ContactType.email
                                  ? ColorManger.kWhite
                                  : ColorManger.kTurquoiseBlue,
                          color:
                              contactType == ContactType.email
                                  ? ColorManger.kTurquoiseBlue
                                  : ColorManger.kBackGround,
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
                        //! CustomButton Phone
                        CustomButtonStyleEnum(
                          title: 'Phone',
                          topRight: 26,
                          bottomRight: 26,
                          titleColor:
                              contactType == ContactType.phone
                                  ? ColorManger.kWhite
                                  : ColorManger.kTurquoiseBlue,
                          color:
                              contactType == ContactType.phone
                                  ? ColorManger.kTurquoiseBlue
                                  : ColorManger.kCodGray,
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
                    //! PageView
                    SizedBox(
                      height: context.height * 0.150,
                      child: PageView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: pageController,
                        children: [
                          //! Email Widget
                          ContactEmailWidget(
                            emailController: emailController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            //! onChanged
                            onChanged: (value) {},
                            //! validator
                            validator: (value) {
                              return null;
                            },
                          ),

                          ContactPhoneWidget(
                            phoneController: phoneController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            //? onChanged
                            onChanged: (value) {
                              if (formKey.currentState != null) {
                                setState(() {});
                              }
                            },
                            //? validator
                            validator: (value) {
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.height * 0.11),
                //! Custom Social Auth Buttons
                CustomSocialAuthButtons(
                  //! onTapGoogle
                  onTapGoogle: () {},
                  //! onTapApple
                  onTapApple: () {},
                ),
                SizedBox(height: context.height * 0.057),
                //! CustomPrimaryButton
                CustomPrimaryButton(
                  backGroundColor: ColorManger.kTurquoiseBlue,
                  titleColor: ColorManger.kWhite,
                  title:
                      contactType == ContactType.phone
                          ? "Create an account"
                          : "Next",

                  onTap: () {
                    context.router.push(CreateAnAccountRoute());
                  },
                  radius: 60,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
