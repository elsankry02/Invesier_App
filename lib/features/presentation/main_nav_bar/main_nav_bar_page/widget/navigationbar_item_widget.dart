import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invesier/core/constant/app_text_theme.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/extension/extension.dart';

class NavigationBarItemWidget extends StatelessWidget {
  final String assetName, title;
  final int selectedIndex, index;
  final Function()? onTap;
  const NavigationBarItemWidget({
    super.key,
    required this.assetName,
    required this.title,
    required this.selectedIndex,
    this.onTap,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: context.height * 0.010,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SVG
            SvgPicture.asset(
              assetName,
              colorFilter: ColorFilter.mode(
                selectedIndex == index ? AppColors.kNum : AppColors.kWhite,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(height: context.height * 0.005),
            // Title
            Text(
              title,
              style: AppTextTheme.kLabelSmall(
                context,
                fontWeight: FontWeight.w400,
                color:
                    selectedIndex == index ? AppColors.kNum : AppColors.kWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
