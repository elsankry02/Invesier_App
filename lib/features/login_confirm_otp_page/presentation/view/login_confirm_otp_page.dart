import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/components/custom_icon_button.dart';
import 'package:invesier/core/components/custom_title_appbar.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/constant/image_manger.dart';

@RoutePage()
class LoginConfirmOtpPage extends StatefulWidget {
  const LoginConfirmOtpPage({super.key});

  @override
  State<LoginConfirmOtpPage> createState() => _LoginConfirmOtpPageState();
}

class _LoginConfirmOtpPageState extends State<LoginConfirmOtpPage> {
  @override
  Widget build(BuildContext context) {
    final kTextTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManger.kAppBar,
        title: CustomTitleAppBar(kTextTheme: kTextTheme, title: 'Confirm OTP'),
        centerTitle: true,
        leading: CustomIconButton(),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(ImageManger.kLogIn2),
          ),
        ),
        child: ListView(),
      ),
    );
  }
}
