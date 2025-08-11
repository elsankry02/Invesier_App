import 'package:flutter/material.dart';

import '../constant/app_colors.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String title;
  final BoxBorder? border;
  final Color? backGroundColor;
  final double radius;
  final EdgeInsetsGeometry? margin, padding;
  final Gradient? gradient;
  final TextStyle? style;
  final bool isLoading;
  final void Function()? onTap;
  const CustomPrimaryButton({
    super.key,
    required this.title,
    this.backGroundColor,
    required this.radius,
    this.margin,
    this.gradient,
    this.style,
    this.onTap,
    this.padding,
    this.isLoading = false, this.border,
  });
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
          color: backGroundColor,
          // borderColor
          border: border,
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
                        color: AppColors.kWhite,
                      ),
                    ),
                  )
                  : Text(title, style: style),
        ),
      ),
    );
  }
}
