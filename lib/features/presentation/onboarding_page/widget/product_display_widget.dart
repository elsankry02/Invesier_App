import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/extension/extension.dart';
import '../../../model/onboarding_model.dart';

class ProductDisplayWidget extends StatelessWidget {
  const ProductDisplayWidget({super.key, required this.item});

  final OnboardingModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Lottie
        Lottie.asset(item.image, fit: BoxFit.cover),
        SizedBox(height: context.height * 0.100),
        // Titel
        Text(
          item.titel,
          textAlign: TextAlign.center,
          style: context.kTextTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: context.height * 0.020),
        // SubTitel
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
