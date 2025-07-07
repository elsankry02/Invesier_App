import 'package:flutter/material.dart';

import '../constant/color_manger.dart';
import '../extension/extension.dart';

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
        // backGroundColor
        color: backGroundColor,
        border: Border.all(width: 1, color: ColorManger.kTurquoiseBlue),
      ),
      // title
      child: Text(
        title,
        style: context.kTextTheme.labelMedium!.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
