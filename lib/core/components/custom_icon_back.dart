import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../constant/color_manger.dart';

class CustomIconBack extends StatelessWidget {
  const CustomIconBack({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.maybePop();
      },
      child: Icon(Icons.arrow_back_ios_rounded, color: ColorManger.kWhite),
    );
  }
}
