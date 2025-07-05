import 'package:flutter/material.dart';
import '../../../../core/constant/color_manger.dart';

class ActionButtonLocationWidget extends StatelessWidget {
  const ActionButtonLocationWidget({super.key, this.onPressed});
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManger.kOceanGreen,
        borderRadius: BorderRadius.circular(30),
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(Icons.add, size: 35)),
    );
  }
}
