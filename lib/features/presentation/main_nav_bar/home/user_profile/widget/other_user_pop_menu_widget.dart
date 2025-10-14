import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invesier/core/constant/app_text_theme.dart';

import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/constant/app_svgs.dart';
import '../../../../../../core/extension/extension.dart';

class OtherUserPopMenuWidget extends StatelessWidget {
  final String title, icon;
  final Function() onTap;
  const OtherUserPopMenuWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });
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
          PopupMenuItem(
            padding: EdgeInsets.zero,
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(icon),
                SizedBox(width: context.height * 0.007),
                Text(
                  title,
                  style: AppTextTheme.kLabelLarge(
                    context,
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
