import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/extension/extension.dart';
import '../../../data/models/onboarding_model.dart';

class GeneratorWidget extends StatelessWidget {
  final int currentIndex;
  const GeneratorWidget({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // List generate
        ...List.generate(items(context).length, (index) {
          return Container(
            margin: EdgeInsets.only(right: 8),
            // width
            width:
                currentIndex == index
                    ? context.width * 0.060
                    : context.width * 0.012,
            height: context.height * 0.006,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color
              color:
                  currentIndex == index
                      ? AppColors.kEucalyptus
                      : AppColors.kWhite,
            ),
          );
        }),
      ],
    );
  }
}
