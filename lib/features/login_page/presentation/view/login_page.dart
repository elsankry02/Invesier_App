import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/components/custom_button_style_enum.dart';
import 'package:invesier/core/components/custom_primary_button.dart';
import 'package:invesier/core/components/custom_rich_text.dart';
import 'package:invesier/core/components/custom_social_auth_buttons.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/constant/image_manger.dart';
import 'package:invesier/core/router/router.dart';
import 'package:invesier/features/signup_page/presentation/widget/contact_email_widget.dart';
import 'package:invesier/features/signup_page/presentation/widget/contact_phone_widget.dart';

enum ContactType { email, phone }

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<LoginPage> {
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
      body: Container(
        decoration: BoxDecoration(
          //! Image
          image: DecorationImage(
            fit: BoxFit.cover,

            image: AssetImage(ImageManger.kLogIn2),
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
                  'Welcome To Invesier!',
                  style: kTextTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 4),
                //! Rich Text
                Center(
                  child: CustomRichText(
                    textSpanOne: "Don't have an account?",
                    textSpanTwo: ' Create an account ',
                    onTap: () {
                      //! Navigate to SignupRoute
                      context.router.replace(SignupRoute());
                    },
                  ),
                ),
                SizedBox(height: h * 0.024),
                Column(
                  children: [
                    //! Contact Type
                    enumContactType(),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            // onChanged
                            onChanged: (value) {
                              if (formKey.currentState != null) {
                                setState(() {});
                              }
                            },
                            // validator
                            validator: (value) {
                              if (value!.trim().toLowerCase() != 'a') {
                                return 'Please enter a valid phone number';
                              } else {
                                return null;
                              }
                            },
                          ),
                          //! Phone Widget
                          ContactPhoneWidget(
                            phoneController: phoneController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            // onChanged
                            onChanged: (value) {
                              if (formKey.currentState != null) {
                                setState(() {});
                              }
                            },
                            // validator
                            validator: (value) {
                              if (value!.trim().toLowerCase() != '1') {
                                return 'Please enter a valid phone number.';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: h * 0.11),
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
                  title: contactType == ContactType.phone ? "Log in" : "Next",
                  horizontal: 0,
                  onTap:
                      contactType == ContactType.phone
                          ? () {
                            if (formKey.currentState!.validate()) {
                              context.router.push(LoginPhoneConfirmOtpRoute());
                            }
                          }
                          : () {
                            if (formKey.currentState!.validate()) {
                              context.router.push(LoginEmailConfirmOtpRoute());
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

  Row enumContactType() {
    return Row(
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
                  : ColorManger.kCodGray,
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
    );
  }
}
