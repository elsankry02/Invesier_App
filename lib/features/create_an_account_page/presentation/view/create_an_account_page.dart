import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/custom_icon_back.dart';
import '../../../../core/components/custom_primary_button.dart';
import '../../../../core/components/custom_rich_text.dart';
import '../../../../core/components/custom_text_form_field.dart';
import '../../../../core/components/custom_title_appbar.dart';
import '../../../../core/constant/color_manger.dart';
import '../../../../core/router/router.dart';
import '../widget/circle_avatar_widget.dart';

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
      backgroundColor: ColorManger.kBackGround,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [
              Row(
                children: [
                  //! CustomIconBack
                  CustomIconBack(),
                  Expanded(
                    child: Column(
                      children: [
                        //! CustomAppBar
                        CustomTitelAppBar(
                          kTextTheme: kTextTheme,
                          title: 'Create an account',
                        ),
                        SizedBox(width: h * 0.020),
                        //! Rich Text
                        CustomRichText(
                          textSpanOne: 'Already have an account?',
                          textSpanTwo: ' Log in',
                          onTap: () {
                            //! Navigate to Login
                            context.router.replace(LoginRoute());
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              //! circle avatar
              CircleAvatarWidget(),
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
                horizontal: 0,
                //! Navigate
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.router.push(SignUpConfirmOtpRoute());
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
