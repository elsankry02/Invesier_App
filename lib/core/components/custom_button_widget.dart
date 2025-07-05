import 'package:flutter/material.dart';
import 'package:invesier/core/extension/extension.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.title,
    required this.vertical,
    required this.radius,
    required this.backGroundColor,
    required this.titleColor,
    required this.horizontal,
    required this.borderColor,
    this.onTap,
  });
  final String title;
  final Function()? onTap;
  final double vertical, horizontal, radius;
  final Color backGroundColor, titleColor, borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: vertical,
          horizontal: horizontal,
        ),
        decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: borderColor),
        ),
        child: Text(
          title,
          style: context.kTextTheme.labelMedium!.copyWith(
            color: titleColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
