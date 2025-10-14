import 'package:flutter/material.dart';
import 'package:invesier/core/constant/app_text_theme.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/extension/extension.dart';
import '../../../data/models/onboarding_model.dart';

class ProductDisplayWidget extends StatelessWidget {
  final OnboardingModel item;
  const ProductDisplayWidget({super.key, required this.item});

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
          style: AppTextTheme.kHeadlineMedium(
            context,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: context.height * 0.020),
        // SubTitel
        Text(
          item.subTitel,
          textAlign: TextAlign.center,
          style: AppTextTheme.kTitleMedium(
            context,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
