import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/custom_icon_button.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_images.dart';
import '../../../../../core/constant/app_svgs.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/router/router.dart';
import '../../home_follow_page/view/home_follow_page.dart';
import '../../../../../core/components/custom_divider_widget.dart';
import '../../../../../core/components/custom_followers_number_widget.dart';
import 'user_alertdialog_widget.dart';
import 'user_pop_menu_widget.dart';

class UserAppBarWidget extends StatelessWidget {
  const UserAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(
        top: context.height * 0.025,
        left: context.height * 0.010,
        right: context.height * 0.030,
      ),
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Custom Icon Back
          CustomIconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.kWhite,
            ),
            onPressed: () {
              context.router.maybePop();
            },
          ),
          // Image
          ClipOval(
            child: Image.asset(
              AppImages.kGirlOne,
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
                  color: AppColors.kGray,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: context.height * 0.008),
            ],
          ),
          // User Pop Menu
          UserPopMenuWidget(
            icon: AppSvgs.kblockVictor,
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
          CustomFollowersNumberWidget(title: 'Posts', number: 2),
          // DividerWidget
          CustomDividerWidget(height: context.height * 0.030, width: 1.5),
          // Fans
          CustomFollowersNumberWidget(
            title: 'Fans',
            number: 7,
            onTap: () {
              context.router.push(
                HomeFollowRoute(initialTab: FollowTabType.fans),
              );
            },
          ),
          // DividerWidget
          CustomDividerWidget(height: context.height * 0.030, width: 1.5),
          // Pioneers
          CustomFollowersNumberWidget(
            title: 'Pioneers',
            number: 7,
            onTap: () {
              context.router.push(
                HomeFollowRoute(initialTab: FollowTabType.pioneers),
              );
            },
          ),
        ],
      ),
    );
  }
}
