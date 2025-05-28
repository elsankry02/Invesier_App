import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/components/custom_primary_button.dart';
import 'package:invesier/core/components/custom_rich_text.dart';
import 'package:invesier/core/components/custom_text_form_field.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/constant/image_manger.dart';
import 'package:invesier/features/create_an_account_page/presentation/widget/circle_avatar_widget.dart';
import 'package:invesier/router/router.dart';

@RoutePage()
class CreateAnAccountPage extends StatefulWidget {
  const CreateAnAccountPage({super.key});

  @override
  State<CreateAnAccountPage> createState() => _CreateAnAccountPageState();
}

class _CreateAnAccountPageState extends State<CreateAnAccountPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final kTextTheme = Theme.of(context).textTheme;
    final userNameController = TextEditingController();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
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
                Row(
                  children: [
                    //! Icon Back
                    IconButton(
                      onPressed: () {
                        context.router.maybePop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: ColorManger.kWhite,
                      ),
                    ),
                    Spacer(),
                    //! Create an account
                    Text(
                      textAlign: TextAlign.center,
                      'Create an account',
                      style: kTextTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(flex: 2),
                  ],
                ),
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
                //! Username
                CustomTextFormField(
                  title: 'Username',
                  controller: userNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'username has already been taken';
                    } else {
                      return 'Valid';
                    }
                  },
                ),
                SizedBox(height: 22),
                //! Text: Fullname
                Text(
                  'Full Name',
                  style: kTextTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                //! Full name
                CustomTextFormField(
                  title: 'Fullname',
                  controller: userNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'username has already been taken';
                    } else {
                      return 'Valid';
                    }
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
                    formKey.currentState!.validate();
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
