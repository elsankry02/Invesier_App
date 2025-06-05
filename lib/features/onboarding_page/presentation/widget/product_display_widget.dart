import 'package:flutter/material.dart';
import '../../../../core/extension/extension.dart';
import 'package:lottie/lottie.dart';

import '../../data/model/onboarding_model.dart';

class ProductDisplayWidget extends StatelessWidget {
  const ProductDisplayWidget({super.key, required this.item});

  final OnboardingModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //! Svg
        Lottie.asset(item.image, fit: BoxFit.cover),
        //
        SizedBox(height: context.h * 0.140),
        //! Titel
        Text(
          item.titel,
          textAlign: TextAlign.center,
          style: context.kTextTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        //
        SizedBox(height: context.h * 0.02),
        //! SubTitel
        Text(
          item.subTitel,
          textAlign: TextAlign.center,
          style: context.kTextTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
