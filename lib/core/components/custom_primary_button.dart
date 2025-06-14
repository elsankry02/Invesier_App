import 'package:flutter/material.dart';
import '../extension/extension.dart';

import '../constant/color_manger.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
    super.key,
    required this.titleColor,
    required this.title,
    required this.horizontal,
    required this.onTap,

    this.border,
    this.backgroundColor,
    this.gradient = const LinearGradient(
      colors: [ColorManger.kEucalyptus, ColorManger.kTurquoiseBlue],
    ),
  });
  final String title;
  final Color titleColor;
  final double horizontal;
  final BoxBorder? border;
  final Gradient? gradient;
  final Color? backgroundColor;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //! onTap
      onTap: onTap,
      child: Container(
        //! horizontal
        margin: EdgeInsets.symmetric(horizontal: horizontal),
        padding: EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
          color: backgroundColor,
          //! border
          border: border,
          borderRadius: BorderRadius.circular(60),
          //! gradient
          gradient: gradient,
        ),
        child: Center(
          //! Title
          child: Text(
            title,
            style: context.kTextTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
              //! titleColor
              color: titleColor,
            ),
          ),
        ),
      ),
    );
  }
}
