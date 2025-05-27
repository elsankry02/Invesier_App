import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/components/custom_rich_text.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/constant/image_manger.dart';
import 'package:invesier/router/router.dart';

@RoutePage()
class CreateAnAccountPage extends StatefulWidget {
  const CreateAnAccountPage({super.key});

  @override
  State<CreateAnAccountPage> createState() => _CreateAnAccountPageState();
}

class _CreateAnAccountPageState extends State<CreateAnAccountPage> {
  @override
  Widget build(BuildContext context) {
    final kTextTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(ImageManger.kLogIn2),
          ),
        ),
        child: SafeArea(
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
            ],
          ),
        ),
      ),
    );
  }
}
