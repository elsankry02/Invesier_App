import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/components/custom_icon_button.dart';
import 'package:invesier/core/constant/app_svgs.dart';
import 'package:invesier/features/presentation/main_nav_bar/home/user_profile_page/widget/user_alertdialog_widget.dart';
import 'package:invesier/features/presentation/main_nav_bar/home/user_profile_page/widget/user_pop_menu_widget.dart';

import '../../../../../../core/components/custom_circuler_progress.dart';
import '../../../../../../core/components/custom_divider_widget.dart';
import '../../../../../../core/components/custom_followers_number_widget.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/constant/app_enums.dart';
import '../../../../../../core/constant/app_images.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/router/router.dart';
import '../../../../../data/models/get/get_user_profile_model.dart';

class UserAppBarWidget extends ConsumerWidget {
  final GetUserProfileModel getUserProfileModel;
  const UserAppBarWidget({super.key, required this.getUserProfileModel});

  @override
  Widget build(BuildContext context, ref) {
    final local = context.kAppLocalizations;
    return Padding(
      padding: EdgeInsets.only(top: context.height * 0.025),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
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

          Expanded(
            child: Container(
              padding: EdgeInsetsDirectional.only(end: 20),
              child: ListTile(
                contentPadding: EdgeInsetsDirectional.zero,
                leading: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl:
                        getUserProfileModel.avatarUrl ?? AppImages.ImageNetwork,
                    width: context.height * 0.068,
                    height: context.height * 0.068,
                    fit: BoxFit.cover,
                    errorWidget:
                        (context, url, error) =>
                            Image.network(AppImages.ImageNetwork),
                    placeholder:
                        (context, url) => CustomCircularProgressIndicator(),
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // title
                        Text(
                          getUserProfileModel.name ??
                              context.kAppLocalizations.name,
                          style: context.kTextTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // subTitle
                        Text(
                          "@${getUserProfileModel.username ?? context.kAppLocalizations.username}",
                          style: context.kTextTheme.bodySmall!.copyWith(
                            color: AppColors.kGray,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
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
                      padding: EdgeInsetsDirectional.only(
                        end: context.height * 0.020,
                        bottom: context.height * 0.010,
                      ),
                      title: local.posts,
                      number: getUserProfileModel.postsCount,
                    ),
                    // DividerWidget
                    CustomDividerWidget(
                      color: AppColors.kWhite,
                      height: context.height * 0.030,
                      width: context.height * 0.002,
                    ),
                    // Fans
                    CustomFollowersNumberWidget(
                      padding: EdgeInsetsDirectional.only(
                        start: context.height * 0.020,
                        end: context.height * 0.020,
                        bottom: context.height * 0.010,
                      ),
                      title: local.fans,
                      number: getUserProfileModel.fansCount,
                      onTap: () {
                        context.router.push(
                          UserFollowersRoute(
                            initialTab: FollowersTabType.fans,
                            getUserProfileModel: getUserProfileModel,
                          ),
                        );
                      },
                    ),
                    // DividerWidget
                    CustomDividerWidget(
                      color: AppColors.kWhite,
                      height: context.height * 0.030,
                      width: context.height * 0.002,
                    ),
                    // Pioneers
                    CustomFollowersNumberWidget(
                      padding: EdgeInsetsDirectional.only(
                        start: context.height * 0.020,
                        bottom: context.height * 0.010,
                      ),
                      title: local.pioneers,
                      number: getUserProfileModel.pioneersCount,
                      onTap: () {
                        context.router.push(
                          UserFollowersRoute(
                            initialTab: FollowersTabType.pioneers,
                            getUserProfileModel: getUserProfileModel,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
