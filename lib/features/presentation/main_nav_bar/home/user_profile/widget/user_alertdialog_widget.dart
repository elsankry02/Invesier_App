import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/components/custom_primary_button.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/func/show_top_snack_bar.dart';

class UserAlertDialogWidget extends StatelessWidget {
  final String title;
  const UserAlertDialogWidget({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    return AlertDialog(
      backgroundColor: AppColors.kHeavyMetal,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            // close back
            child: IconButton(
              onPressed: () {
                context.router.maybePop();
              },
              icon: Icon(Icons.close, color: AppColors.kWhite, size: 20),
            ),
          ),
          SizedBox(height: context.height * 0.014),
          // title
          Text(
            title,
            style: context.kTextTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: context.height * 0.020),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomPrimaryButton(
                title: local.no,
                backGroundColor: AppColors.kBackGround,
                borderRadius: BorderRadius.circular(31),
                style: context.kTextTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.kWhite,
                ),
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: context.height * 0.034,
                  vertical: context.height * 0.006,
                ),
                onTap: () {
                  context.router.maybePop();
                },
              ),
              CustomPrimaryButton(
                title: local.yesBlock,
                backGroundColor: AppColors.kRedTwo,
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: context.height * 0.027,
                  vertical: context.height * 0.006,
                ),
                borderRadius: BorderRadius.circular(31),
                style: context.kTextTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.kWhite,
                ),
                onTap: () {
                  context.router.maybePop();
                  ErrorMessage(context, message: local.comingsoon);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
