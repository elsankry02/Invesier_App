import 'package:flutter/material.dart';
import 'package:invesier/core/extension/extension.dart';

class SideMenuTitleWidget extends StatelessWidget {
  const SideMenuTitleWidget({super.key, required this.title, this.onTap});
  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text(
          title,
          style: context.kTextTheme.labelMedium!.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
