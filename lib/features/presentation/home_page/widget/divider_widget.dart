import 'package:flutter/material.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/extension/extension.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.5,
      height: context.height * 0.030,
      color: ColorManger.kWhite,
    );
  }
}
