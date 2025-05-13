import 'package:flutter/material.dart';
import 'package:invesier/constant/color_manger.dart';
import 'package:invesier/model/onboarding_model.dart';

class GenerateWidget extends StatelessWidget {
  const GenerateWidget({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(items(context).length, (index) {
          return Container(
            margin: EdgeInsets.only(right: 8),
            width: currentIndex == index ? 25 : 6,
            height: 6,
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
