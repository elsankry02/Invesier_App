import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invesier/core/components/show_custom_top_snack_bar.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_svgs.dart';
import '../../../../../core/extension/extension.dart';

class PopMenuButtonWidget extends StatelessWidget {
  const PopMenuButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      offset: Offset(0, 35),
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
      icon: SvgPicture.asset(AppSvgs.kPopMenu),
      color: AppColors.kHeavyMetal,
      iconColor: AppColors.kWhite,
      itemBuilder: (context) {
        return [
          // Pin post
          PopupMenuItem(
            onTap: () {
              showCustomErrorMessage(context, message: "COMING SOON");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // svg icon
                SvgPicture.asset(AppSvgs.kPin),
                SizedBox(width: 7),
                // title
                Text(
                  'Pin post',
                  style: context.kTextTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          // Divider
          const PopupMenuItem(
            height: 1,
            enabled: false,
            child: Divider(color: AppColors.kDivider, thickness: 1),
          ),
          // Delete post
          PopupMenuItem(
            onTap: () {
              showCustomErrorMessage(context, message: "COMING SOON");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // svg icon
                SvgPicture.asset(AppSvgs.kDelete),
                SizedBox(width: 7),
                // title
                Text(
                  'Delete post',
                  style: context.kTextTheme.labelLarge!.copyWith(
                    color: AppColors.kRed,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ];
      },
    );
  }
}
