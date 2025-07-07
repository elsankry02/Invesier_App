import 'package:flutter/material.dart';

import '../../../../../core/constant/color_manger.dart';

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
      // onTap
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(color: ColorManger.kWhite),
      ),
    );
  }
}
