import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constant/app_lotties.dart';
import '../extension/extension.dart';

class CustomNoPostsWidget extends StatelessWidget {
  const CustomNoPostsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    return Column(
      children: [
        Lottie.asset(AppLotties.kNoItem),
        Text(
          textAlign: TextAlign.center,
          local.nopoststodisplay,
          style: context.kTextTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
