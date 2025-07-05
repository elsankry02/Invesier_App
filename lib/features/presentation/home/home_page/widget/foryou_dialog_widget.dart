import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../../core/components/custom_button_widget.dart';
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
            child: IconButton(
              onPressed: () {
                context.router.maybePop();
              },
              icon: Icon(Icons.close, color: ColorManger.kWhite, size: 20),
            ),
          ),
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
              CustomButtonWidget(
                title: 'Cancel',
                titleColor: ColorManger.kWhite,
                backGroundColor: ColorManger.kBoulder,
                borderColor: ColorManger.kBoulder,
                horizontal: 36,
                vertical: 4,
                radius: 31,
                onTap: () {
                  context.router.maybePop();
                },
              ),
              CustomButtonWidget(
                title: 'Report',
                titleColor: ColorManger.kWhite,
                backGroundColor: ColorManger.kRedTwo,
                borderColor: ColorManger.kRedTwo,
                horizontal: 36,
                vertical: 4,
                radius: 31,
                onTap: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
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
