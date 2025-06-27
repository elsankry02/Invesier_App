import 'package:flutter/material.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/extension/extension.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.title,
    this.onTap,
    required this.vertical,
    required this.radius,
  });
  final String title;
  final Function()? onTap;
  final double vertical;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: vertical, horizontal: 20),
        decoration: BoxDecoration(
          color: ColorManger.kOceanGreen,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Text(
          title,
          style: context.kTextTheme.labelMedium!.copyWith(
            color: ColorManger.kBackGround,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
