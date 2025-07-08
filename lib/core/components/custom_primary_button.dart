import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
    super.key,
    this.onTap,
    required this.title,
    required this.radius,
    this.backGroundColor,
    this.gradient,
    required this.style,
    required this.borderColor,
    required this.paddingVertical,
    required this.marginHorizontal,
    required this.paddingHorizontal,
  });
  final String title;
  final Color borderColor;
  final Color? backGroundColor;
  final double paddingVertical, paddingHorizontal, radius, marginHorizontal;
  final Gradient? gradient;
  final TextStyle? style;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap
      onTap: onTap,
      child: Container(
        // margin
        margin: EdgeInsets.symmetric(horizontal: marginHorizontal),
        // padding
        padding: EdgeInsets.symmetric(
          vertical: paddingVertical,
          horizontal: paddingHorizontal,
        ),
        decoration: BoxDecoration(
          // backgroundColor
          color: backGroundColor,
          // borderColor
          border: Border.all(color: borderColor),
          // borderRadius
          borderRadius: BorderRadius.circular(radius),
          // gradient
          gradient: gradient,
        ),
        child: Center(
          // Title
          child: Text(title, style: style),
        ),
      ),
    );
  }
}
