import 'package:flutter/material.dart';

import '../constant/color_manger.dart';
import '../extension/extension.dart';

class CustomButtonStyleEnum extends StatelessWidget {
  const CustomButtonStyleEnum({
    super.key,
    required this.title,
    required this.titleColor,
    required this.color,
    required this.onTap,
    this.topRight = 0,
    this.topLeft = 0,
    this.bottomLeft = 0,
    this.bottomRight = 0,
  });
  final String title;
  final Color color, titleColor;
  final double? topLeft, topRight, bottomLeft, bottomRight;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.5, horizontal: 52),
        decoration: BoxDecoration(
          // colorcolor
          color: color,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(topRight!),
            // topRight
            bottomLeft: Radius.circular(bottomLeft!),
            // bottomLeft
            bottomRight: Radius.circular(bottomRight!),
            // bottomRight
            topLeft: Radius.circular(topLeft!),
          ),
          border: Border.all(color: ColorManger.kTurquoiseBlue),
        ),
        child: Center(
          // title
          child: Text(
            title,
            style: context.kTextTheme.titleMedium!.copyWith(
              // titleColor
              color: titleColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
