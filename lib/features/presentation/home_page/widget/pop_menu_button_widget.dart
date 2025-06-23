import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/constant/svg_manger.dart';
import 'package:invesier/core/extension/extension.dart';

class PopMenuButtonWidget extends StatelessWidget {
  const PopMenuButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      offset: Offset(0, 30),

      icon: SvgPicture.asset(SvgManger.kPopMenu),
      color: ColorManger.kHeavyMetal,
      iconColor: ColorManger.kWhite,
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: Row(
              children: [
                SvgPicture.asset(SvgManger.kPin),
                SizedBox(width: 7),
                Text(
                  'Pin post',
                  style: context.kTextTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const PopupMenuItem(
            height: 1,
            enabled: false,
            child: Divider(thickness: 1),
          ),
          PopupMenuItem(
            child: Row(
              children: [
                SvgPicture.asset(SvgManger.kDelete),
                SizedBox(width: 7),
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
