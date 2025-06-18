import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/extension/extension.dart';

class NavigationBarItemWidget extends StatelessWidget {
  const NavigationBarItemWidget({
    super.key,
    required this.assetName,
    required this.title,
    required this.selectedIndex,
    this.onTap,
    required this.index,
  });
  final String assetName;
  final String title;
  final int selectedIndex;
  final int index;
  final Function()? onTap;
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
            //! SVG
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
            //! Title
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
