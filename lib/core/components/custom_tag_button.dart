import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constant/app_colors.dart';

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
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.kGray),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          spacing: context.height * 0.009,
          children: [
            // Svg
            SvgPicture.asset(svg),
            // title
            Text(
              title,
              style: context.kTextTheme.labelMedium!.copyWith(
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
