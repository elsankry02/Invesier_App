import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/color_manger.dart';
import '../../../../core/extension/extension.dart';

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
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SVG
            SvgPicture.asset(
              assetName,
              colorFilter: ColorFilter.mode(
                selectedIndex == index
                    ? ColorManger.kOceanGreen
                    : ColorManger.kWhite,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(height: context.height * 0.005),
            // Title
            Text(
              title,
              style: context.kTextTheme.bodySmall!.copyWith(
                color:
                    selectedIndex == index
                        ? ColorManger.kWhite
                        : ColorManger.kGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
