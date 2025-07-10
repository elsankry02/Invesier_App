import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
    super.key,
    required this.title,
    required this.borderColor,
    this.backGroundColor,
    required this.radius,
    this.margin,
    this.gradient,
    this.style,
    this.onTap,
    this.padding,
  });
  final String title;
  final Color borderColor;
  final Color? backGroundColor;
  final double radius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
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
        margin: margin,
        // padding
        padding: padding,
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
