import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/components/custom_primary_button.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/constant/image_manger.dart';
import 'package:invesier/core/router/router.dart';
import 'package:invesier/features/signup_otp_page/presentation/widget/signup_pinput_widget.dart';
import 'package:invesier/features/signup_otp_page/presentation/widget/signup_rich_text_widget.dart';

@RoutePage()
class SignUpOtpPage extends StatefulWidget {
  const SignUpOtpPage({super.key});

  @override
  State<SignUpOtpPage> createState() => _SignUpOtpPageState();
}

class _SignUpOtpPageState extends State<SignUpOtpPage> {
  final formKey = GlobalKey<FormState>();
  final pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final kTextTheme = Theme.of(context).textTheme;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManger.kAppBar,
        centerTitle: true,
        //! Create an account
        title: Text(
          textAlign: TextAlign.center,
          'Verify your phone number',
          style: kTextTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        //! Icon Back
        leading: IconButton(
          onPressed: () {
            context.router.maybePop();
          },
          icon: Icon(Icons.arrow_back_ios_rounded, color: ColorManger.kWhite),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(ImageManger.kLogIn2),
          ),
        ),
        child: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              //! Enter the OTP code sent your phone number
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
              //! OTP Code
              Text(
                'OTP Code',
                style: kTextTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: h * 0.015),
              //! Signup Pinput Widget
              SignupPinputWidget(
                controller: pinController,
                onChanged: (value) {},
                validator: (value) {
                  if (value!.length < 6) {
                    return 'Please enter the full 6-digit code';
                  }
                  return null;
                },
              ),
              SizedBox(height: h * 0.196),

              //!
              Text(
                textAlign: TextAlign.center,
                'Resend OTP (59 seconds)',
                style: kTextTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: h * 0.015),
              //! Verify code
              CustomPrimaryButton(
                title: 'Verify code',
                titleColor: ColorManger.kWhite,
                gradient: LinearGradient(
                  colors: [ColorManger.kEucalyptus, ColorManger.kTurquoiseBlue],
                ),
                horizontal: 0,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    //! Navigate to ###########
                    context.router.push(WelcomeRoute());
                  }
                },
              ),
              SizedBox(height: h * 0.015),
              //! SignUp Rich Text
              SignUpRichTextWidget(
                termsOfUseOnTap: () {},
                privacyPolicyOnTap: () {},
                kTextTheme: kTextTheme,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
