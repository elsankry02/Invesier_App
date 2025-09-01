import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constant/app_lotties.dart';
import '../extension/extension.dart';

class CustomNoPostsWidget extends StatelessWidget {
  final String title;
  const CustomNoPostsWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(AppLotties.kNoItem),
        Text(
          textAlign: TextAlign.center,
          title,
          style: context.kTextTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
