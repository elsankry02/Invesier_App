import 'package:flutter/material.dart';
import 'package:invesier/constant/color_manger.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    final kText = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        gradient: LinearGradient(
          colors: [ColorManger.kEucalyptus, ColorManger.kTurquoiseBlue],
        ),
      ),
      child: Center(
        child: Text(
          'Next',
          style: kText.titleMedium!.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
