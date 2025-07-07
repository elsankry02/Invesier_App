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
                titleColor: ColorManger.kWhite,
                backGroundColor: ColorManger.kBoulder,
                borderColor: ColorManger.kBoulder,
                paddingHorizontal: 36,
                paddingVertical: 4,
                marginHorizontal: 0,
                radius: 31,
                onTap: () {
                  context.router.maybePop();
                },
              ),
              // Report
              CustomPrimaryButton(
                title: 'Report',
                titleColor: ColorManger.kWhite,
                backGroundColor: ColorManger.kRedTwo,
                borderColor: ColorManger.kRedTwo,
                paddingHorizontal: 36,
                paddingVertical: 4,
                marginHorizontal: 0,
                radius: 31,
                onTap: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      // Report Reason Dialog
                      return ReportReasonDialog();
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
