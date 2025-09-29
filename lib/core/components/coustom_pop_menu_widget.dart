import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant/app_colors.dart';
import '../constant/app_svgs.dart';
import '../extension/extension.dart';

class CustomPopMenuWidget extends StatelessWidget {
  final String pinTitle, deleteTitle, pinSvg, deleteSvg;

  final void Function()? pinOnTap;
  final void Function()? deleteOnTap;
  const CustomPopMenuWidget({
    super.key,
    this.pinOnTap,
    this.deleteOnTap,
    required this.pinTitle,
    required this.deleteTitle,
    required this.pinSvg,
    required this.deleteSvg,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: EdgeInsets.zero,
      offset: const Offset(0, 35),
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
      icon: SvgPicture.asset(AppSvgs.kPopMenu),
      color: AppColors.kHeavyMetal,
      iconColor: AppColors.kWhite,
      itemBuilder: (context) {
        return [
          // First item
          PopupMenuItem(
            padding: EdgeInsets.zero,
            onTap: pinOnTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(pinSvg),
                SizedBox(width: context.height * 0.007),
                Text(
                  pinTitle,
                  style: context.kTextTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          // Divider
          PopupMenuItem(
            padding: EdgeInsets.zero,
            height: 1,
            enabled: false,
            child: Divider(
              color: AppColors.kDivider,
              thickness: context.height * 0.001,
            ),
          ),
          // Second item
          PopupMenuItem(
            padding: EdgeInsets.zero,
            onTap: deleteOnTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(deleteSvg),
                SizedBox(width: context.height * 0.007),
                Text(
                  deleteTitle,
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
