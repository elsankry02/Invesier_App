import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invesier/constant/color_manger.dart';
import 'package:invesier/constant/svg_manger.dart';

class WelcomeDisplayWidget extends StatelessWidget {
  const WelcomeDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).textTheme;
    final h = MediaQuery.of(context).size.height;
    return ListTile(
      title: Column(
        children: [
          SizedBox(height: h * 0.22),
          SvgPicture.asset(SvgManger.kGroup),
          SizedBox(height: h * 0.19),
          //! titel
          Text(
            'Compete for Rewards',
            textAlign: TextAlign.center,
            style: appTextTheme.headlineMedium!.copyWith(
              color: ColorManger.kWhite,
              fontWeight: FontWeight.w700,
            ),
          ),
          //! SubTitel
          Text(
            'Climb the leaderboard, unlock perks, and earn real-world opportunities',
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
