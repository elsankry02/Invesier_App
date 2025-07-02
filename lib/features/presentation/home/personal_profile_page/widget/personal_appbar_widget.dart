import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/constant/image_manger.dart';
import 'package:invesier/core/extension/extension.dart';
import 'package:invesier/features/presentation/home/home_page/widget/divider_widget.dart';
import 'package:invesier/features/presentation/home/home_page/widget/following_number_widget.dart';

class PersonalAppBarWidget extends StatelessWidget {
  const PersonalAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              context.router.maybePop();
            },
            //! Icon
            icon: Icon(Icons.arrow_back_ios_new, color: ColorManger.kWhite),
          ),
          ClipOval(
            // Image
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
          DividerWidget(),
          // Fans
          FollowingNumberWidget(title: 'Fans', number: '358'),
          DividerWidget(),
          // Pioneers
          FollowingNumberWidget(title: 'Pioneers', number: '172'),
        ],
      ),
    );
  }
}
