import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invesier/core/constant/app_text_theme.dart';

import '../../../../../../core/components/custom_button_sheet_widget.dart';
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
import '../../../../../data/providers/get/get_authenticated_user_provider.dart';

class PersonalAppBarWidget extends ConsumerWidget {
  const PersonalAppBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final local = context.kAppLocalizations;
    final state = ref.watch(getAuthenticatedUserProvider);
    if (state is GetAuthenticatedUserSuccess) {
      final user = state.userModel;
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
                      imageUrl: user.avatarUrl,
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
                            user.name,
                            style: AppTextTheme.kLabelMedium(
                              context,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          // subTitle
                          Text(
                            "@${user.username}",
                            style: AppTextTheme.kLabelMedium(
                              context,
                              color: AppColors.kGray,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      CustomIconButton(
                        icon: SvgPicture.asset(AppSvgs.kPopMenu),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return CustomButtonSheetWidget(
                                firstTitle: local.wallet,
                                firstIcon:
                                    Icons.account_balance_wallet_outlined,
                                onFirstTap: () {
                                  context.router.maybePop();
                                  context.router.push(WalletRoute());
                                },
                                secondTitle: local.settings,
                                secondIcon: Icons.settings_outlined,
                                onSecondTap:
                                    () => context.router.push(SettingsRoute()),
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
                        number: user.postsCount,
                      ),
                      // DividerWidget
                      CustomDividerWidget(
                        color: AppColors.kWhite,
                        height: context.height * 0.030,
                        width: context.height * 0.001,
                      ),
                      // Fans
                      CustomFollowersNumberWidget(
                        padding: EdgeInsetsDirectional.only(
                          start: context.height * 0.020,
                          end: context.height * 0.020,
                          bottom: context.height * 0.010,
                        ),
                        number: state.userModel.fansCount,
                        title: local.fans,
                        onTap: () {
                          context.router.push(
                            PersonalFollowersRoute(
                              initialPage: 0,
                              initialTab: FollowersTabType.fans,
                            ),
                          );
                        },
                      ),
                      // DividerWidget
                      CustomDividerWidget(
                        color: AppColors.kWhite,
                        height: context.height * 0.030,
                        width: context.height * 0.001,
                      ),
                      // Pioneers
                      CustomFollowersNumberWidget(
                        padding: EdgeInsetsDirectional.only(
                          start: context.height * 0.020,
                          bottom: context.height * 0.010,
                        ),
                        number: user.pioneersCount,
                        title: local.pioneers,
                        onTap: () {
                          context.router.push(
                            PersonalFollowersRoute(
                              initialPage: 1,
                              initialTab: FollowersTabType.pioneers,
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
    if (state is GetAuthenticatedUserFaliure) {
      return Text(state.errMessage);
    }
    return SizedBox();
  }
}
