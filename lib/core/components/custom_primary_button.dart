import 'package:flutter/material.dart';
import 'package:invesier/core/constant/color_manger.dart';

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
    this.isLoading = false,
  });
  final String title;
  final Color borderColor;
  final Color? backGroundColor;
  final double radius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Gradient? gradient;
  final TextStyle? style;
  final bool isLoading;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap
      onTap: isLoading ? null : onTap,
      child: Container(
        // margin
        margin: margin,
        // padding
        padding: padding,
        decoration: BoxDecoration(
          // backgroundColor
          color: isLoading ? ColorManger.kDarkenText : backGroundColor,
          // borderColor
          border: Border.all(color: borderColor),
          // borderRadius
          borderRadius: BorderRadius.circular(radius),
          // gradient
          gradient: gradient,
        ),
        child: Center(
          // Title
          child:
              isLoading
                  ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: ColorManger.kPrimary,
                      ),
                    ),
                  )
                  : Text(title, style: style),
        ),
      ),
    );
  }
}
