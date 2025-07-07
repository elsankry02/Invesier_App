import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/custom_icon_button.dart';
import '../../../../../core/constant/color_manger.dart';
import '../../../../../core/constant/image_manger.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/router/router.dart';
import '../../home_follow_page/view/home_follow_page.dart';
import '../../home_page/widget/divider_widget.dart';
import '../../home_page/widget/following_number_widget.dart';

class PersonalAppBarWidget extends StatelessWidget {
  const PersonalAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Custom Icon Back
          CustomIconButton(icon: Icon(Icons.arrow_back_ios)),
          // Image
          ClipOval(
            child: Image.asset(
              ImageManger.kBoyFour,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          Text(
            'Alex Johnson',
            style: context.kTextTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          // subTitle
          Text(
            '@johnson_a',
            style: context.kTextTheme.labelMedium!.copyWith(
              color: ColorManger.kGray,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: context.height * 0.008),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Posts
          FollowingNumberWidget(title: 'Posts', number: '84'),
          // DividerWidget
          DividerWidget(height: context.height * 0.030, width: 1.5),
          // Fans
          FollowingNumberWidget(
            title: 'Fans',
            number: '358',
            onTap: () {
              context.router.push(
                HomeFollowRoute(initialTab: HomeFollowEnum.fans),
              );
            },
          ),
          // DividerWidget
          DividerWidget(height: context.height * 0.030, width: 1.5),
          // Pioneers
          FollowingNumberWidget(
            title: 'Pioneers',
            number: '172',
            onTap: () {
              context.router.push(
                HomeFollowRoute(initialTab: HomeFollowEnum.pioneers),
              );
            },
          ),
        ],
      ),
    );
  }
}
