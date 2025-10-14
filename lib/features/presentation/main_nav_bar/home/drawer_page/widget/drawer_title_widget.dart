import 'package:flutter/material.dart';
import 'package:invesier/core/constant/app_text_theme.dart';

import '../../../../../../core/extension/extension.dart';

class DrawerTitleWidget extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const DrawerTitleWidget({super.key, required this.title, this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      // onTap
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: context.height * 0.008),
        // title
        child: Text(
          title,
          style: AppTextTheme.kLabelMedium(
            context,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
