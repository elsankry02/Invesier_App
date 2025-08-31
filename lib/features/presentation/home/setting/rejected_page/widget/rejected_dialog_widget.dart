import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/components/custom_icon_button.dart';
import '../../../../../../core/components/custom_primary_button.dart';
import '../../../../../../core/components/show_custom_top_snack_bar.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/router/router.dart';

class RejectedDialogWidget extends StatelessWidget {
  const RejectedDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: CustomIconButton(
              icon: Icon(Icons.close, color: AppColors.kWhite),
              onPressed: () => context.router.maybePop(),
            ),
          ),
          Text(
            "Request attempt notice",
            style: context.kTextTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: context.height * 0.016),
          Text(
            textAlign: TextAlign.center,
            "You can send 3 requests per month. This will use one. Continue?",
            style: context.kTextTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: context.height * 0.022),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomPrimaryButton(
                title: "Cancel",
                backGroundColor: AppColors.kGray,
                borderRadius: BorderRadius.circular(31),
                padding: EdgeInsets.symmetric(
                  horizontal: context.height * 0.035,
                  vertical: context.height * 0.004,
                ),
                style: context.kTextTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                onTap: () => context.router.maybePop(),
              ),
              CustomPrimaryButton(
                title: "Continue",
                backGroundColor: AppColors.kTurquoiseBlue,
                borderRadius: BorderRadius.circular(31),
                padding: EdgeInsets.symmetric(
                  horizontal: context.height * 0.029,
                  vertical: context.height * 0.004,
                ),
                style: context.kTextTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                onTap: () {
                  context.router.maybePop();
                  showCustomSuccessMessage(context, message: "Request Success");
                  context.router.replace(YouAreVerifiedRoute());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
