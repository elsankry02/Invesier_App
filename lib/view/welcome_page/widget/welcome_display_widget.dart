import 'package:flutter/material.dart';
import 'package:invesier/constant/color_manger.dart';
import 'package:invesier/constant/lottie_manger.dart';
import 'package:lottie/lottie.dart';

class WelcomeDisplayWidget extends StatelessWidget {
  const WelcomeDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).textTheme;
    final h = MediaQuery.of(context).size.height;
    return ListTile(
      title: Column(
        children: [
          SizedBox(height: h * 0.18),
          Lottie.asset(LottieManger.kOnboardingTwo),

          //! titel
          Text(
            'Compete for Rewards',
            textAlign: TextAlign.center,
            style: appTextTheme.headlineMedium!.copyWith(
              color: ColorManger.kWhite,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: h * 0.012),
          //! SubTitel
          Text(
            'Climb the leaderboard, unlock perks, and \nearn real-world opportunities',
            textAlign: TextAlign.center,
            style: appTextTheme.titleMedium!.copyWith(
              color: ColorManger.kWhite,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
