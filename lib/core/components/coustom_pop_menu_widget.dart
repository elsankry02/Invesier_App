import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant/app_colors.dart';
import '../constant/app_svgs.dart';
import '../extension/extension.dart';

class CustomPopMenuWidget extends StatelessWidget {
  final String firstTitle;
  final String secondTitle;
  final void Function()? onFirstTap;
  final void Function()? onSecondTap;

  const CustomPopMenuWidget({
    super.key,
    required this.firstTitle,
    required this.secondTitle,
    required this.onFirstTap,
    required this.onSecondTap,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      offset: const Offset(0, 35),
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
      icon: SvgPicture.asset(AppSvgs.kPopMenu),
      color: AppColors.kHeavyMetal,
      iconColor: AppColors.kWhite,
      itemBuilder: (context) {
        return [
          // First item
          PopupMenuItem(
            onTap: onFirstTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppSvgs.kPin),
                const SizedBox(width: 7),
                Text(
                  firstTitle,
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
          // Second item
          PopupMenuItem(
            onTap: onSecondTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppSvgs.kDelete),
                const SizedBox(width: 7),
                Text(
                  secondTitle,
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
