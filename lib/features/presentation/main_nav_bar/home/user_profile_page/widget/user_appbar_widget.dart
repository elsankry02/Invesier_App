import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/features/data/models/get_user_profile_model.dart';

import '../../../../../../core/components/custom_divider_widget.dart';
import '../../../../../../core/components/custom_followers_number_widget.dart';
import '../../../../../../core/components/custom_icon_button.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/constant/app_svgs.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/router/router.dart';
import '../../followers_page/view/followers_page.dart';
import 'user_alertdialog_widget.dart';
import 'user_pop_menu_widget.dart';

class UserAppBarWidget extends StatelessWidget {
  final GetUserProfileModel getUserProfileModel;
  const UserAppBarWidget({super.key, required this.getUserProfileModel});

  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
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
            child: Image.network(
              getUserProfileModel.avatarUrl,
              width: context.height * 0.060,
              height: context.height * 0.060,
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
                getUserProfileModel.name,
                style: context.kTextTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              // subTitle
              Text(
                getUserProfileModel.username,
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
            title: local.blockuser,
            onTap: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return UserAlertDialogWidget(
                    title: local.areyousureyouwanttoblockthisaccount,
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
          CustomFollowersNumberWidget(title: local.posts, number: 2),
          // DividerWidget
          CustomDividerWidget(
            height: context.height * 0.030,
            width: context.height * 0.001,
          ),
          // Fans
          CustomFollowersNumberWidget(
            title: local.fans,
            number: 7,
            onTap: () {
              context.router.push(
                HomeFollowRoute(initialTab: FollowTabType.fans),
              );
            },
          ),
          // DividerWidget
          CustomDividerWidget(
            height: context.height * 0.030,
            width: context.height * 0.001,
          ),
          // Pioneers
          CustomFollowersNumberWidget(
            title: local.pioneers,
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
