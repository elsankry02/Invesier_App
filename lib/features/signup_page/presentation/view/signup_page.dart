import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/custom_button_style_enum.dart';
import '../../../../core/components/custom_primary_button.dart';
import '../../../../core/components/custom_rich_text.dart';
import '../../../../core/components/custom_social_auth_buttons.dart';
import '../../../../core/constant/color_manger.dart';
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
    final kTextTheme = Theme.of(context).textTheme;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorManger.kBackGround,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24),
            children: [
              //! Create an account
              Text(
                textAlign: TextAlign.center,
                'Create an account',
                style: kTextTheme.headlineSmall!.copyWith(
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
              SizedBox(height: h * 0.024),
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
                  SizedBox(height: h * 0.047),
                  //! PageView
                  SizedBox(
                    height: h * 0.150,
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: pageController,
                      children: [
                        //! Email Widget
                        ContactEmailWidget(
                          emailController: emailController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          //? onChanged
                          onChanged: (value) {
                            if (formKey.currentState != null) {
                              setState(() {});
                            }
                          },
                          //? validator
                          validator: (value) {
                            if (value!.trim().toLowerCase() == 'a') {
                              return null;
                            } else {
                              return 'Please enter a valid phone number';
                            }
                          },
                        ),
                        //! Phone Widget
                        ContactPhoneWidget(
                          phoneController: phoneController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          //? onChanged
                          onChanged: (value) {
                            if (formKey.currentState != null) {
                              setState(() {});
                            }
                          },
                          //? validator
                          validator: (value) {
                            if (value!.trim().toLowerCase() == '1') {
                              return null;
                            } else {
                              return 'Please enter a valid phone number.';
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: h * 0.11),
              //! Custom Social Auth Buttons
              CustomSocialAuthButtons(
                //! onTapGoogle
                onTapGoogle: () {},
                //! onTapApple
                onTapApple: () {},
              ),
              SizedBox(height: h * 0.057),
              //! CustomPrimaryButton
              CustomPrimaryButton(
                backgroundColor: ColorManger.kTurquoiseBlue,
                titleColor: ColorManger.kWhite,
                title:
                    contactType == ContactType.phone
                        ? "Create an account"
                        : "Next",
                horizontal: 0,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.router.push(CreateAnAccountRoute());
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
