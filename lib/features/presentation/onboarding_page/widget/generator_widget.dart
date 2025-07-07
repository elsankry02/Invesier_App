import 'package:flutter/material.dart';

import '../../../../core/constant/color_manger.dart';
import '../../../../core/extension/extension.dart';
import '../../../model/onboarding_model.dart';

class GeneratorWidget extends StatelessWidget {
  const GeneratorWidget({super.key, required this.currentIndex});

  final int currentIndex;

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
                      ? ColorManger.kEucalyptus
                      : ColorManger.kWhite,
            ),
          );
        }),
      ],
    );
  }
}
