import 'package:flutter/material.dart';
import 'package:invesier/core/extension/extension.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.title,
    this.onTap,
    required this.vertical,
    required this.radius,
    required this.backGroundColor,
    required this.titleColor,
    required this.horizontal,
  });
  final String title;
  final Function()? onTap;
  final double vertical, horizontal, radius;
  final Color backGroundColor, titleColor;

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
