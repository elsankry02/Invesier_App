import 'package:flutter/material.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/extension/extension.dart';

class SettingsItemWidget extends StatelessWidget {
  final Widget? leading;
  final String title;
  final Widget? subtitle;
  final Color? color;
  final void Function()? onTap;
  const SettingsItemWidget({
    super.key,
    this.leading,

    this.subtitle,
    this.onTap,
    this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 33, vertical: 8),
        margin: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: AppColors.kHeavyMetal,
          borderRadius: BorderRadius.circular(11),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: leading,
          title: Text(
            title,
            style: context.kTextTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
          subtitle: subtitle,
        ),
      ),
    );
  }
}
