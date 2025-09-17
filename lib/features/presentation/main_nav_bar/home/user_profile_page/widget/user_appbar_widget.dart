import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/constant/app_enums.dart';
import '../../../../../../core/router/router.dart';
import '../../../../../data/models/get_user_profile_model.dart';
import '../../../../../data/providers/get/get_user_profile_provider.dart';

import '../../../../../../core/components/custom_divider_widget.dart';
import '../../../../../../core/components/custom_followers_number_widget.dart';
import '../../../../../../core/components/custom_icon_button.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/constant/app_svgs.dart';
import '../../../../../../core/extension/extension.dart';
import 'user_alertdialog_widget.dart';
import 'user_pop_menu_widget.dart';

class UserAppBarWidget extends ConsumerWidget {
  final GetUserProfileModel getUserProfileModel;

  const UserAppBarWidget({super.key, required this.getUserProfileModel});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(getUserProfileProvider);
    final local = context.kAppLocalizations;
    if (state is GetUserProfileSuccess) {
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
                state.getUserProfileModel.avatarUrl,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // title
                Text(
                  state.getUserProfileModel.name,
                  style: context.kTextTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // subTitle
                Text(
                  state.getUserProfileModel.username,
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
            CustomFollowersNumberWidget(
              title: local.posts,
              number: getUserProfileModel.postsCount,
            ),
            // DividerWidget
            CustomDividerWidget(
              height: context.height * 0.030,
              width: context.height * 0.001,
            ),
            // Fans
            CustomFollowersNumberWidget(
              title: local.fans,
              number: getUserProfileModel.fansCount,
              onTap: () {
                context.router.push(
                  UserFollowersRoute(initialTab: FollowersTabType.fans),
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
              number: getUserProfileModel.pioneersCount,
              onTap: () {
                context.router.push(
                  UserFollowersRoute(initialTab: FollowersTabType.fans),
                );
              },
            ),
          ],
        ),
      );
    }
    return SizedBox();
  }
}
