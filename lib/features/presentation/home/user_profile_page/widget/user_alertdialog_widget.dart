import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/components/show_custom_top_snack_bar.dart';

import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/extension/extension.dart';

class UserAlertDialogWidget extends StatelessWidget {
  final String title;
  const UserAlertDialogWidget({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.kCodGray,
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
                title: 'No',
                backGroundColor: AppColors.kBackGround,
                borderColor: AppColors.kBackGround,
                radius: 31,
                style: context.kTextTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.kWhite,
                ),
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 34,
                  vertical: 6,
                ),
                onTap: () {
                  context.router.maybePop();
                },
              ),
              CustomPrimaryButton(
                title: 'Yes, block',
                backGroundColor: AppColors.kRedTwo,
                borderColor: AppColors.kRedTwo,
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 27.5,
                  vertical: 6,
                ),
                radius: 31,
                style: context.kTextTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.kWhite,
                ),
                onTap: () {
                  context.router.maybePop();
                  showCustomErrorMessage(context, message: "COMING SOON");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
