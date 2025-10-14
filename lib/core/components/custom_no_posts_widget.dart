import 'package:flutter/material.dart';
import 'package:invesier/core/constant/app_text_theme.dart';
import 'package:lottie/lottie.dart';

import '../constant/app_lotties.dart';

class CustomNoPostsWidget extends StatelessWidget {
  final String title;
  const CustomNoPostsWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(AppLotties.kNoItem),
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextTheme.kTitleMedium(
            context,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
