import 'package:flutter/material.dart';
import 'package:invesier/core/constant/app_text_theme.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constant/app_lotties.dart';
import '../../../../core/extension/extension.dart';

class WelcomeDisplayWidget extends StatelessWidget {
  const WelcomeDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    return ListTile(
      title: Column(
        children: [
          SizedBox(height: context.height * 0.18),
          Lottie.asset(AppLotties.kOnboardingTwo),

          // titel
          Text(
            local.competeforrewards,
            textAlign: TextAlign.center,
            style: AppTextTheme.kHeadlineMedium(
              context,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: context.height * 0.012),
          // SubTitel
          Text(
            local.climbtheleaderboardunlockperksandearnrealworldopportunities,
            textAlign: TextAlign.center,
            style: AppTextTheme.kTitleMedium(
              context,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
