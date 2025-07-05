import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/constant/image_manger.dart';
import 'package:invesier/core/constant/svg_manger.dart';
import 'package:invesier/core/extension/extension.dart';
import 'package:invesier/core/router/router.dart';
import 'package:invesier/features/presentation/home/home_follow_page/view/home_follow_page.dart';
import 'package:invesier/features/presentation/home/home_page/widget/divider_widget.dart';
import 'package:invesier/features/presentation/home/home_page/widget/following_number_widget.dart';
import 'package:invesier/features/presentation/home/user_profile_page/widget/user_alertdialog_widget.dart';
import 'package:invesier/features/presentation/home/user_profile_page/widget/user_pop_menu_widget.dart';

class UserAppBarWidget extends StatelessWidget {
  const UserAppBarWidget({super.key});

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
              ImageManger.kGirlOne,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
          // User Pop Menu
          UserPopMenuWidget(
            icon: SvgManger.kblockVictor,
            title: 'Block user',
            onTap: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return UserAlertDialogWidget(
                    title: 'Are you sure you want to block this \naccount?',
                  );
                },
              );
            },
          ),
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
