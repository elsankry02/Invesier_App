import 'package:flutter/material.dart';
import 'package:invesier/core/extension/extension.dart';

class EnumItem extends StatelessWidget {
  const EnumItem({
    super.key,
    required this.title,
    required this.backGroundColor,
    this.onTap,
    required this.titleColor,
  });
  final String title;
  final Color backGroundColor;
  final Color titleColor;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 26, vertical: 8),
        decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          title,
          style: context.kTextTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w600,
            color: titleColor,
          ),
        ),
      ),
    );
  }
}
