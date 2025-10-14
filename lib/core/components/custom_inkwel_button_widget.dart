import 'package:flutter/material.dart';
import 'package:invesier/core/constant/app_text_theme.dart';

import '../extension/extension.dart';

class CustomInkwelButtonWidget extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final IconData? icon;
  const CustomInkwelButtonWidget({
    super.key,
    required this.title,
    this.onTap,
    this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: context.height * 0.010),
        width: context.width,
        decoration: BoxDecoration(),
        child: Row(
          spacing: context.height * 0.010,
          children: [
            Icon(icon),

            Text(
              // title
              title,
              style: AppTextTheme.kTitleMedium(
                context,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
