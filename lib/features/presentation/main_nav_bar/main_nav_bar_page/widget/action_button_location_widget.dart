import 'package:flutter/material.dart';
import 'package:invesier/core/extension/extension.dart';

import '../../../../../core/constant/app_colors.dart';

class ActionButtonLocationWidget extends StatelessWidget {
  final Function()? onPressed;
  const ActionButtonLocationWidget({super.key, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kNum, width: 2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.add,
          size: context.height * 0.040,
          color: AppColors.kNum,
        ),
      ),
    );
  }
}
