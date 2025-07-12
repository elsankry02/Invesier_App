import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';

class EnumItem extends StatelessWidget {
  const EnumItem({
    super.key,
    required this.title,
    required this.backGroundColor,
    this.onTap,
    required this.titleColor,
  });
  final String title;
  final Color backGroundColor, titleColor;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap
      onTap: onTap,
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 26, vertical: 8),
        decoration: BoxDecoration(
          // backGroundColor
          color: backGroundColor,
          borderRadius: BorderRadius.circular(18),
        ),
        // title
        child: Text(
          title,
          style: context.kTextTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w900,
            // titleColor
            color: titleColor,
          ),
        ),
      ),
    );
  }
}
