import 'package:flutter/material.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
    super.key,
    this.onTap,
    required this.titelColor,
    required this.titel,
    this.gradient,
    this.border,
  });
  final void Function()? onTap;
  final String titel;
  final BoxBorder? border;
  final Color titelColor;
  final Gradient? gradient;
  @override
  Widget build(BuildContext context) {
    final kTextTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        padding: EdgeInsets.symmetric(vertical: 11),
        decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadius.circular(60),
          gradient: gradient,
        ),
        child: Center(
          child: Text(
            titel,
            style: kTextTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: titelColor,
            ),
          ),
        ),
      ),
    );
  }
}
