import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/constant/color_manger.dart';
import 'package:invesier/constant/image_manger.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,

            image: AssetImage(ImageManger.kLogIn2),
          ),
        ),
        child: ListView(
          children: [
            Text(
              textAlign: TextAlign.center,
              'LoginPage',
              style: TextStyle(fontSize: 55, color: ColorManger.kPersianRed),
            ),
          ],
        ),
      ),
    );
  }
}
