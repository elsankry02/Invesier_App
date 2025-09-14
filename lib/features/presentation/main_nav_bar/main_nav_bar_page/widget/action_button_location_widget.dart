import 'package:flutter/material.dart';

import '../../../../../core/constant/app_colors.dart';

class ActionButtonLocationWidget extends StatelessWidget {
  final Function()? onPressed;
  const ActionButtonLocationWidget({super.key, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kOceanGreen,
        borderRadius: BorderRadius.circular(30),
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(Icons.add, size: 35)),
    );
  }
}
