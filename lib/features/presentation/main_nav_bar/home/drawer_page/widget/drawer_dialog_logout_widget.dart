import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/constant/app_text_theme.dart';

import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/extension/extension.dart';

class DrawerDialogLogOutWidget extends StatelessWidget {
  final void Function()? onPressed;
  const DrawerDialogLogOutWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    return AlertDialog(
      backgroundColor: AppColors.kHeavyMetal,
      title: Text(local.confirm),
      content: Text(
        local.areyousureyouwanttologout,
        style: AppTextTheme.kTitleSmall(context, fontWeight: FontWeight.w600),
      ),
      actions: [
        TextButton(
          onPressed: () => context.router.maybePop(),
          child: Text(
            local.cancel,
            style: AppTextTheme.kLabelLarge(
              context,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            local.logout,
            style: AppTextTheme.kLabelLarge(
              context,
              fontWeight: FontWeight.w500,
              color: AppColors.kRedTwo,
            ),
          ),
        ),
      ],
    );
  }
}
