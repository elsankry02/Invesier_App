import 'package:flutter/material.dart';
import 'package:invesier/core/components/custom_icon_back.dart';

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
          CustomIconBack(),
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
