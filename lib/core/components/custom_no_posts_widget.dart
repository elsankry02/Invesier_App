import 'package:flutter/material.dart';
import 'package:invesier/core/constant/app_lotties.dart';
import 'package:invesier/core/extension/extension.dart';
import 'package:lottie/lottie.dart';

class CustomNoPostsWidget extends StatelessWidget {
  const CustomNoPostsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(AppLotties.kNoItem),
        Text(
          textAlign: TextAlign.center,
          "No posts to display",
          style: context.kTextTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
