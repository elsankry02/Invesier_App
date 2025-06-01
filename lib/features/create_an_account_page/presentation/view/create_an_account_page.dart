import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/components/custom_primary_button.dart';
import 'package:invesier/core/components/custom_rich_text.dart';
import 'package:invesier/core/components/custom_text_form_field.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/constant/image_manger.dart';
import 'package:invesier/core/router/router.dart';
import 'package:invesier/features/create_an_account_page/presentation/widget/circle_avatar_widget.dart';

@RoutePage()
class CreateAnAccountPage extends StatefulWidget {
  const CreateAnAccountPage({super.key});

  @override
  State<CreateAnAccountPage> createState() => _CreateAnAccountPageState();
}

class _CreateAnAccountPageState extends State<CreateAnAccountPage> {
  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final fullNameController = TextEditingController();
  @override
  void dispose() {
    userNameController.dispose();
    fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final kTextTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManger.kAppBar,
        centerTitle: true,
        //! Create an account
        title: Text(
          textAlign: TextAlign.center,
          'Create an account',
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
            padding: EdgeInsets.symmetric(horizontal: 24),
            children: [
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
              SizedBox(height: 16),
              //! circle avatar
              CircleAvatarWidget(onPressed: () {}),
              SizedBox(height: 22),
              //! Text: Username
              Text(
                'User Name',
                style: kTextTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              //! Username FormField
              CustomTextFormField(
                title: 'Username',
                controller: userNameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.trim().toLowerCase() != 'a') {
                    return 'Please enter a valid Username';
                  }

                  return null;
                },
              ),
              SizedBox(height: 22),
              Text(
                'Full Name',
                style: kTextTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4),
              //! Fullname FormField
              CustomTextFormField(
                title: 'Fullname',
                controller: fullNameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: (value) {},
                validator: (value) {
                  if (value!.trim().toLowerCase() != 'a') {
                    return 'Please enter a valid Fullname';
                  }
                  return null;
                },
              ),
              SizedBox(height: h * 0.090),
              //! Next Button
              CustomPrimaryButton(
                titleColor: ColorManger.kWhite,
                title: 'Next',
                gradient: LinearGradient(
                  colors: [ColorManger.kEucalyptus, ColorManger.kPrimary],
                ),
                horizontal: 0,
                //! Navigate
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.router.push(VerifyYourPhoneNumberRoute());
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
