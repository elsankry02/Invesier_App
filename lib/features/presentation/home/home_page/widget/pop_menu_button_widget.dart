import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../core/constant/color_manger.dart';
import '../../../../../core/constant/svg_manger.dart';
import '../../../../../core/extension/extension.dart';

class PopMenuButtonWidget extends StatelessWidget {
  const PopMenuButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      // Popup Menu Button تحكم ف مكان ال
      offset: Offset(0, 35),
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
      icon: SvgPicture.asset(SvgManger.kPopMenu),
      color: ColorManger.kHeavyMetal,
      iconColor: ColorManger.kWhite,
      itemBuilder: (context) {
        return [
          // Pin post
          PopupMenuItem(
            onTap: () {
              showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.info(
                  backgroundColor: ColorManger.kSecondary,
                  message: "The post has been pinned successfully",
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // svg icon
                SvgPicture.asset(SvgManger.kPin),
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
            child: Divider(color: ColorManger.kDivider, thickness: 1),
          ),
          // Delete post
          PopupMenuItem(
            onTap: () {
              showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.info(
                  backgroundColor: ColorManger.kRedTwo,
                  message: "The post has been deleted",
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // svg icon
                SvgPicture.asset(SvgManger.kDelete),
                SizedBox(width: 7),
                // title
                Text(
                  'Delete post',
                  style: context.kTextTheme.labelLarge!.copyWith(
                    color: ColorManger.kRed,
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
