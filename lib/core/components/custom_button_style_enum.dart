import 'package:flutter/material.dart';

import '../constant/app_colors.dart';
import '../extension/extension.dart';

class CustomButtonStyleEnum extends StatelessWidget {
  final String title;
  final Color color, titleColor;
  final BorderRadiusGeometry? borderRadius;
  final void Function() onTap;
  const CustomButtonStyleEnum({
    super.key,
    required this.title,
    required this.titleColor,
    required this.color,
    required this.onTap,
    this.borderRadius,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.5, horizontal: 52),
        decoration: BoxDecoration(
          // color color
          color: color,
          // border Radius
          borderRadius: borderRadius,
          border: Border.all(color: AppColors.kTurquoiseBlue),
        ),
        child: Center(
          // title
          child: Text(
            title,
            style: context.kTextTheme.titleMedium!.copyWith(
              // title Color
              color: titleColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
