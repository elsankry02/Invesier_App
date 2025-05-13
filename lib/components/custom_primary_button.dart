import 'package:flutter/material.dart';
import 'package:invesier/constant/color_manger.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({super.key, this.onTap, required this.textColor});
  final void Function()? onTap;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    final kText = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        padding: EdgeInsets.symmetric(vertical: 11),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          gradient: LinearGradient(
            colors: [ColorManger.kEucalyptus, ColorManger.kTurquoiseBlue],
          ),
        ),
        child: Center(
          child: Text(
            'Next',
            style: kText.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
