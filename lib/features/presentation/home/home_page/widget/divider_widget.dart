import 'package:flutter/material.dart';
import 'package:invesier/core/constant/color_manger.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
    required this.height,
    required this.width,
    this.onTap,
  });
  final double height, width;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(width: width, height: height, color: ColorManger.kWhite),
    );
  }
}
