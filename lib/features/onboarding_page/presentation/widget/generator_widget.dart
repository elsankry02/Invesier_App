import 'package:flutter/material.dart';
import '../../../../core/extension/extension.dart';

import '../../../../core/constant/color_manger.dart';
import '../../data/model/onboarding_model.dart';

class GeneratorWidget extends StatelessWidget {
  const GeneratorWidget({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(items(context).length, (index) {
          return Container(
            margin: EdgeInsets.only(right: 8),
            width:
                currentIndex == index ? context.w * 0.060 : context.w * 0.012,
            height: context.h * 0.006,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:
                  currentIndex == index
                      ? ColorManger.kEucalyptus
                      : ColorManger.kWhite,
            ),
          );
        }),
      ],
    );
  }
}

extension on BuildContext {
  get w => null;
}
