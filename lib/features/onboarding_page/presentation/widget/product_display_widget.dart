import 'package:flutter/material.dart';
import '../../data/model/onboarding_model.dart';
import 'package:lottie/lottie.dart';

class ProductDisplayWidget extends StatelessWidget {
  const ProductDisplayWidget({super.key, required this.item});

  final OnboardingModel item;

  @override
  Widget build(BuildContext context) {
    final kText = Theme.of(context).textTheme;
    final h = MediaQuery.of(context).size.height;
    return Column(
      children: [
        //! Svg
        Lottie.asset(item.image, fit: BoxFit.cover),
        //
        SizedBox(height: h * 0.140),
        //! Titel
        Text(
          item.titel,
          textAlign: TextAlign.center,
          style: kText.headlineMedium!.copyWith(fontWeight: FontWeight.w700),
        ),
        //
        SizedBox(height: h * 0.02),
        //! SubTitel
        Text(
          item.subTitel,
          textAlign: TextAlign.center,
          style: kText.titleMedium!.copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
