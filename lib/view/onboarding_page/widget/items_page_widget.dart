import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invesier/constant/color_manger.dart';
import 'package:invesier/model/onboarding_model.dart';

class ItemsPageWidget extends StatelessWidget {
  const ItemsPageWidget({super.key, required this.item});

  final OnboardingModel item;

  @override
  Widget build(BuildContext context) {
    final kText = Theme.of(context).textTheme;

    return Column(
      children: [
        SizedBox(height: 180),
        // Svg
        SvgPicture.asset(item.image, fit: BoxFit.cover, height: 110),
        SizedBox(height: 200),
        // Titel
        Text(
          item.titel,
          textAlign: TextAlign.center,
          style: kText.headlineMedium!.copyWith(
            color: ColorManger.kWhite,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 15),
        // SubTitel
        Text(
          item.subTitel,
          textAlign: TextAlign.center,
          style: kText.titleMedium!.copyWith(
            color: ColorManger.kWhite,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
