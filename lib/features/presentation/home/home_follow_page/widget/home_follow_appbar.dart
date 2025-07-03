import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/constant/image_manger.dart';
import 'package:invesier/core/extension/extension.dart';

class HomeFollowAppBarWidget extends StatelessWidget {
  const HomeFollowAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              context.router.maybePop();
            },
            // Icon
            icon: Icon(Icons.arrow_back_ios_new, color: ColorManger.kWhite),
          ),
          ClipOval(
            // Image
            child: Image.asset(
              ImageManger.kBoyFour,
              width: 25,
              height: 25,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      title: Text(
        'Alex Johnson',
        style: context.kTextTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle:
      // subTitle
      Text(
        '@johnson_a',
        style: context.kTextTheme.bodySmall!.copyWith(
          color: ColorManger.kGray,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
