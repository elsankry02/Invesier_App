import 'package:flutter/material.dart';
import 'package:invesier/core/constant/app_colors.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: AppColors.kDarkenText),
    );
  }
}
