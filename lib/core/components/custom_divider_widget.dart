import 'package:flutter/material.dart';

class CustomDividerWidget extends StatelessWidget {
  final double height, width;
  final Color color;
  final Function()? onTap;
  const CustomDividerWidget({
    super.key,
    required this.height,
    required this.width,
    this.onTap,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(color: color),
      ),
    );
  }
}
