import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/components/custom_button_style_enum.dart';
import 'package:invesier/core/components/custom_primary_button.dart';
import 'package:invesier/core/components/custom_rich_text.dart';
import 'package:invesier/core/components/custom_social_auth_buttons.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/constant/image_manger.dart';
import 'package:invesier/features/signup_page/presentation/widget/contact_email_widget.dart';
import 'package:invesier/features/signup_page/presentation/widget/contact_phone_widget.dart';
import 'package:invesier/router/router.dart';

enum ContactType { email, phone }

@RoutePage()
class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formkey = GlobalKey<FormState>();
  final pageController = PageController(initialPage: 1);
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  ContactType contactType = ContactType.phone;

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
            key: formkey,
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
                //! LoginOptionsWidget
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a valid Email';
                              } else {
                                return 'valid';
                              }
                            },
                          ),
                          //! Phone Widget
                          ContactPhoneWidget(
                            phoneController: phoneController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a valid phone number.';
                              } else {
                                return 'valid';
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
                    context.router.push(CreateAnAccountRoute());
                    formkey.currentState!.validate();
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
