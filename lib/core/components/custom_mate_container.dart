import 'package:flutter/material.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/extension/extension.dart';

class CustomMateContainer extends StatelessWidget {
  const CustomMateContainer({
    super.key,
    required this.title,
    this.backGroundColor,
  });
  final String title;
  final Color? backGroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(vertical: 4, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: backGroundColor,
        border: Border.all(width: 1, color: ColorManger.kTurquoiseBlue),
      ),
      child: Text(
        title,
        style: context.kTextTheme.labelMedium!.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
