import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/constant/svg_manger.dart';
import 'package:invesier/core/extension/extension.dart';
import 'package:invesier/features/presentation/home/user_profile_page/widget/user_alertdialog_widget.dart';

class UserPopMenuWidget extends StatelessWidget {
  const UserPopMenuWidget({super.key});

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
            onTap: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return UserAlertDialogWidget();
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.block),
                SizedBox(width: 7),
                Text(
                  'Block user',
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
