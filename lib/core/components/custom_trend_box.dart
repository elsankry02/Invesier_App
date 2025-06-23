import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invesier/core/extension/extension.dart';

class CustomTrendBox extends StatelessWidget {
  const CustomTrendBox({
    super.key,
    required this.svg,
    required this.title,
    required this.titleColor,
    required this.borderColor,
    this.onTap,
  });
  final String svg;
  final String title;
  final Color titleColor;
  final Color borderColor;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
            //! Svg
            SvgPicture.asset(svg),
            //! title
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
