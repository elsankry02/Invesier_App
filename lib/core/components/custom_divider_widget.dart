import 'package:flutter/material.dart';

import '../constant/app_colors.dart';

class CustomDividerWidget extends StatelessWidget {
  final double height, width;
  final Function()? onTap;
  const CustomDividerWidget({
    super.key,
    required this.height,
    required this.width,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(color: AppColors.kWhite),
      ),
    );
  }
}
