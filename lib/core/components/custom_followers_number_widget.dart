import 'package:flutter/material.dart';
import 'package:invesier/core/constant/app_text_theme.dart';

import '../constant/app_colors.dart';

class CustomFollowersNumberWidget extends StatelessWidget {
  final String title;
  final int number;
  final BoxBorder? border;
  final EdgeInsetsGeometry padding;
  final Function()? onTap;
  const CustomFollowersNumberWidget({
    super.key,
    required this.title,
    required this.number,
    this.onTap,
    this.border,
    required this.padding,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(border: border),
        padding: padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // number
            Text(
              "$number",
              style: AppTextTheme.kTitleMedium(
                context,
                fontWeight: FontWeight.w700,
              ),
            ),
            // title
            Text(
              title,
              style: AppTextTheme.kLabelMedium(
                context,
                fontWeight: FontWeight.w400,
                color: AppColors.kGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
