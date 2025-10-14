import 'package:flutter/material.dart';
import 'package:invesier/core/constant/app_text_theme.dart';

class CustomAppBarTitle extends StatelessWidget {
  final String title;
  const CustomAppBarTitle({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      title,
      style: AppTextTheme.kTitleLarge(context, fontWeight: FontWeight.w600),
    );
  }
}
