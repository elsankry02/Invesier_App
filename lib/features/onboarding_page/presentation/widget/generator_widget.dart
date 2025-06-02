import 'package:flutter/material.dart';
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
          final h = MediaQuery.of(context).size.height;
          final w = MediaQuery.of(context).size.width;
          return Container(
            margin: EdgeInsets.only(right: 8),
            width: currentIndex == index ? w * 0.060 : w * 0.012,
            height: h * 0.006,
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
