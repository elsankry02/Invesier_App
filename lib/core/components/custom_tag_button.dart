import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invesier/core/constant/app_text_theme.dart';

import '../extension/extension.dart';

class CustomTagButton extends StatelessWidget {
  final String title, svg;
  final Color titleColor;
  final Function()? onTap;
  const CustomTagButton({
    super.key,
    required this.svg,
    required this.title,
    required this.titleColor,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap
      onTap: onTap,
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(
          vertical: context.height * 0.005,
          horizontal: context.height * 0.017,
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
        child: Row(
          spacing: context.height * 0.009,
          children: [
            // Svg
            SvgPicture.asset(svg),
            // title
            Text(
              title,
              style: AppTextTheme.kLabelMedium(
                context,
                color: titleColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
