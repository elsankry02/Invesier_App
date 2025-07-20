import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/custom_icon_button.dart';
import '../../../../core/components/custom_primary_button.dart';
import '../../../../core/components/custom_rich_text.dart';
import '../../../../core/components/custom_text_form_field.dart';
import '../../../../core/components/custom_title_appbar.dart';
import '../../../../core/constant/color_manger.dart';
import '../../../../core/extension/extension.dart';
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
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                Row(
                  children: [
                    // Custom Icon Back
                    CustomIconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: ColorManger.kWhite,
                      ),
                      onPressed: () {
                        context.router.maybePop();
                      },
                    ),
                    //
                    Expanded(
                      child: Column(
                        children: [
                          CustomTitelAppBar(title: 'Create an account'),
                          SizedBox(height: context.height * 0.004),
                          // Rich Text
                          CustomRichText(
                            textSpanOne: 'Already have an account?',
                            textSpanTwo: ' Log in',
                            onTap: () {
                              // Navigate to Login
                              context.router.replace(LoginRoute());
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: context.height * 0.016),
                // circle avatar
                CircleAvatarWidget(),
                SizedBox(height: context.height * 0.022),
                // Text: Username
                Text(
                  'User Name',
                  style: context.kTextTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: context.height * 0.004),
                // Username FormField
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
                  style: context.kTextTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                // Fullname FormField
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
                SizedBox(height: context.height * 0.090),
                // Next Button
                CustomPrimaryButton(
                  title: 'Next',

                  gradient: LinearGradient(
                    colors: [
                      ColorManger.kEucalyptus,
                      ColorManger.kTurquoiseBlue,
                    ],
                  ),
                  borderColor: ColorManger.kTurquoiseBlue,
                  radius: 60,
                  padding: EdgeInsetsDirectional.symmetric(vertical: 13),
                  style: context.kTextTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorManger.kWhite,
                  ),
                  // Navigate
                  onTap: () {
                    context.router.push(CustomConfirmOtpRoute());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
