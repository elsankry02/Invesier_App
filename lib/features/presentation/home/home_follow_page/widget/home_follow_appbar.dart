import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/custom_icon_button.dart';
import '../../../../../core/constant/color_manger.dart';
import '../../../../../core/constant/image_manger.dart';
import '../../../../../core/extension/extension.dart';

class HomeFollowAppBarWidget extends StatelessWidget {
  const HomeFollowAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Custom Icon Back
          CustomIconButton(
            icon: Icon(Icons.arrow_back_ios, color: ColorManger.kWhite),
            onPressed: () {
              context.router.maybePop();
            },
          ),
          // Image
          ClipOval(
            child: Image.asset(
              ImageManger.kBoyFour,
              width: 25,
              height: 25,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      // title
      title: Text(
        'Alex Johnson',
        style: context.kTextTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      // subTitle
      subtitle: Text(
        '@johnson_a',
        style: context.kTextTheme.bodySmall!.copyWith(
          color: ColorManger.kGray,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
