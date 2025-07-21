import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../extension/extension.dart';

class CustomTrendBox extends StatelessWidget {
  final String title, svg;
  final Color titleColor, borderColor;
  const CustomTrendBox({
    super.key,
    required this.svg,
    required this.title,
    required this.titleColor,
    required this.borderColor,
    this.onTap,
  });

  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap
      onTap: onTap,
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(vertical: 5, horizontal: 17.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          spacing: 9,
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
