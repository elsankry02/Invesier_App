import 'package:flutter/material.dart';
import 'package:invesier/constant/color_manger.dart';

class CustomButtonEnum extends StatelessWidget {
  const CustomButtonEnum({
    super.key,
    required this.title,
    required this.titleColor,
    required this.color,
    required this.onTap,
    this.topRight = 0,
    this.topLeft = 0,
    this.bottomLeft = 0,
    this.bottomRight = 0,
  });
  final Color color;
  final String title;
  final double? topLeft;
  final double? topRight;
  final Color titleColor;
  final double? bottomLeft;
  final double? bottomRight;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    final kTextTheme = Theme.of(context).textTheme;
    // final h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.5, horizontal: 52),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(topRight!),
            bottomLeft: Radius.circular(bottomLeft!),
            bottomRight: Radius.circular(bottomRight!),
            topLeft: Radius.circular(topLeft!),
          ),
          border: Border.all(color: ColorManger.kTurquoiseBlue),
        ),
        child: Center(
          child: Text(
            title,
            style: kTextTheme.titleLarge!.copyWith(
              color: titleColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
