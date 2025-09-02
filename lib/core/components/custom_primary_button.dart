import 'package:flutter/material.dart';
import 'package:invesier/core/extension/extension.dart';

import '../constant/app_colors.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String title;
  final BoxBorder? border;
  final Color? backGroundColor;
  final EdgeInsetsGeometry? margin, padding;
  final BorderRadiusGeometry? borderRadius;
  final Gradient? gradient;
  final TextStyle? style;
  final bool isLoading;
  final void Function()? onTap;
  const CustomPrimaryButton({
    super.key,
    required this.title,
    this.backGroundColor,
    this.margin,
    this.gradient,
    this.style,
    this.onTap,
    this.padding,
    this.isLoading = false,
    this.border,
    this.borderRadius,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: backGroundColor,
          border: border,
          borderRadius: borderRadius,
          gradient: gradient,
        ),
        child: Center(
          child:
              isLoading
                  ? Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.width * 0.020,
                    ),
                    child: SizedBox(
                      width: context.height * 0.020,
                      height: context.height * 0.020,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.kWhite,
                      ),
                    ),
                  )
                  : Text(title, textAlign: TextAlign.center, style: style),
        ),
      ),
    );
  }
}
