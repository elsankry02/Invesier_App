import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/constant/svg_manger.dart';
import 'package:invesier/core/extension/extension.dart';

class UserPopMenuWidget extends StatelessWidget {
  const UserPopMenuWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final String title, icon;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      offset: Offset(0, 35),
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
      icon: SvgPicture.asset(SvgManger.kPopMenu),
      color: ColorManger.kHeavyMetal,
      iconColor: ColorManger.kWhite,
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // icon
                SvgPicture.asset(icon),
                SizedBox(width: 7),
                // title
                Text(
                  title,
                  style: context.kTextTheme.labelLarge!.copyWith(
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
