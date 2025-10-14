import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/constant/app_text_theme.dart';

import '../../../../../../core/components/custom_circuler_progress.dart';
import '../../../../../../core/components/custom_divider_widget.dart';
import '../../../../../../core/components/custom_followers_number_widget.dart';
import '../../../../../../core/components/custom_icon_button.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/constant/app_enums.dart';
import '../../../../../../core/constant/app_images.dart';
import '../../../../../../core/constant/app_svgs.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/router/router.dart';
import '../../../../../data/models/get/get_user_profile_model.dart';
import 'other_user_pop_menu_widget.dart';
import 'user_alertdialog_widget.dart';

class OtherUserProfileAppBar extends ConsumerWidget {
  final GetUserProfileModel getUserProfileModel;
  final String imageUrl, title, subTitle;
  final int postsCountNumber, fansCountNumber, pioneersCountNumber;
  const OtherUserProfileAppBar({
    required this.getUserProfileModel,
    required this.pioneersCountNumber,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    required this.postsCountNumber,
    required this.fansCountNumber,
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final local = context.kAppLocalizations;
    return Padding(
      padding: EdgeInsets.only(top: context.height * 0.025),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomIconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.kWhite,
            ),
            onPressed: () => context.router.maybePop(),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsetsDirectional.only(end: 20),
              child: ListTile(
                contentPadding: EdgeInsetsDirectional.zero,
                leading: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
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
                        Text(
                          title,
                          style: AppTextTheme.kBodySmall(
                            context,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          subTitle,
                          style: AppTextTheme.kBodySmall(
                            context,
                            color: AppColors.kGray,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    OtherUserPopMenuWidget(
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
                    CustomFollowersNumberWidget(
                      padding: EdgeInsetsDirectional.only(
                        end: context.height * 0.020,
                        bottom: context.height * 0.010,
                      ),
                      title: local.posts,
                      number: postsCountNumber,
                    ),
                    CustomDividerWidget(
                      color: AppColors.kWhite,
                      height: context.height * 0.030,
                      width: context.height * 0.002,
                    ),
                    CustomFollowersNumberWidget(
                      padding: EdgeInsetsDirectional.only(
                        start: context.height * 0.020,
                        end: context.height * 0.020,
                        bottom: context.height * 0.010,
                      ),
                      title: local.fans,
                      number: fansCountNumber,
                      onTap:
                          () => context.router.push(
                            UserConnectionsRoute(
                              initialPage: 0,
                              initialTab: FollowersTabType.fans,
                              getUserProfileModel: getUserProfileModel,
                            ),
                          ),
                    ),
                    CustomDividerWidget(
                      color: AppColors.kWhite,
                      height: context.height * 0.030,
                      width: context.height * 0.002,
                    ),
                    CustomFollowersNumberWidget(
                      padding: EdgeInsetsDirectional.only(
                        start: context.height * 0.020,
                        bottom: context.height * 0.010,
                      ),
                      title: local.pioneers,
                      number: pioneersCountNumber,
                      onTap: () {
                        context.router.push(
                          UserConnectionsRoute(
                            initialPage: 1,
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
