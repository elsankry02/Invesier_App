import 'package:flutter/material.dart';
import '../../../../core/extension/extension.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constant/lottie_manger.dart';

class WelcomeDisplayWidget extends StatelessWidget {
  const WelcomeDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        children: [
          SizedBox(height: context.height * 0.18),
          Lottie.asset(LottieManger.kOnboardingTwo),

          //! titel
          Text(
            'Compete for Rewards',
            textAlign: TextAlign.center,
            style: context.kTextTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: context.height * 0.012),
          //! SubTitel
          Text(
            'Climb the leaderboard, unlock perks, and \nearn real-world opportunities',
            textAlign: TextAlign.center,
            style: context.kTextTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
