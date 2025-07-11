import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/constant/color_manger.dart';
import '../../../../../core/extension/extension.dart';

class UserAlertDialogWidget extends StatelessWidget {
  const UserAlertDialogWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorManger.kCodGray,
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
              icon: Icon(Icons.close, color: ColorManger.kWhite, size: 20),
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
              // Custom Primary Button No
              CustomPrimaryButton(
                title: 'No',
                backGroundColor: ColorManger.kBackGround,
                borderColor: ColorManger.kBackGround,
                radius: 31,
                style: context.kTextTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: ColorManger.kWhite,
                ),
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 34,
                  vertical: 6,
                ),
                onTap: () {
                  context.router.maybePop();
                },
              ),
              // CustomPrimaryButton Yes, block
              CustomPrimaryButton(
                title: 'Yes, block',

                backGroundColor: ColorManger.kRedTwo,
                borderColor: ColorManger.kRedTwo,
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 27.5,
                  vertical: 6,
                ),
                radius: 31,
                style: context.kTextTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: ColorManger.kWhite,
                ),
                onTap: () {
                  context.router.maybePop();
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.info(
                      backgroundColor: ColorManger.kRedTwo,
                      message: "The user has been blocked successfully",
                    ),
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
