import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/custom_icon_button.dart';
import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/constant/color_manger.dart';
import '../../../../../core/extension/extension.dart';
import 'report_reason_dialog.dart';

class ForYouDialogWidget extends StatelessWidget {
  const ForYouDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            // Custom Icon Back
            child: CustomIconButton(
              icon: Icon(Icons.close, color: ColorManger.kWhite, size: 20),
              onPressed: () {
                context.router.maybePop();
              },
            ),
          ),
          // title
          Text(
            'Report this post and block the account',
            style: context.kTextTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: context.height * 0.020),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Cancel
              CustomPrimaryButton(
                title: 'Cancel',
                backGroundColor: ColorManger.kBoulder,
                borderColor: ColorManger.kBoulder,
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 36,
                  vertical: 4,
                ),
                radius: 31,
                style: context.kTextTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: ColorManger.kWhite,
                ),
                onTap: () {
                  context.router.maybePop();
                },
              ),
              // Report
              CustomPrimaryButton(
                title: 'Report',

                backGroundColor: ColorManger.kRedTwo,
                borderColor: ColorManger.kRedTwo,
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 36,
                  vertical: 4,
                ),
                radius: 31,
                style: context.kTextTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: ColorManger.kWhite,
                ),
                onTap: () async {
                  await context.router.maybePop();
                  if (context.mounted) {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        // Report Reason Dialog
                        return ReportReasonDialog();
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
