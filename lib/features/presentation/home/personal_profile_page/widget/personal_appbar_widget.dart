import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/components/custom_button_sheet_widget.dart';
import '../../../../../core/components/custom_divider_widget.dart';
import '../../../../../core/components/custom_followers_number_widget.dart';
import '../../../../../core/components/custom_icon_button.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_svgs.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/router/router.dart';
import '../../../../data/provider/get/get_authenticated_user_provider.dart';
import '../../home_follow_page/view/home_follow_page.dart';

class PersonalAppBarWidget extends StatelessWidget {
  const PersonalAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(getAuthenticatedUserProvider);
        if (state is GetAuthenticatedUserSuccess) {
          final user = state.userModel;
          return ListTile(
            contentPadding: EdgeInsetsDirectional.only(
              top: context.height * 0.025,
              start: context.height * 0.010,
              end: context.height * 0.030,
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
                    user.avatarUrl,
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
                      user.name,
                      style: context.kTextTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // subTitle
                    Text(
                      user.username,
                      style: context.kTextTheme.labelMedium!.copyWith(
                        color: AppColors.kGray,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: context.height * 0.008),
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
                          firstIcon: Icons.account_balance_wallet_outlined,
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
                  title: local.posts,
                  number: user.postsCount,
                ),
                // DividerWidget
                CustomDividerWidget(
                  height: context.height * 0.030,
                  width: context.height * 0.001,
                ),
                // Fans
                CustomFollowersNumberWidget(
                  number: state.userModel.fansCount,
                  title: local.fans,
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
                  number: user.pioneersCount,
                  title: local.pioneers,
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
        if (state is GetAuthenticatedUserFaliure) {
          return Text(state.errMessage);
        }
        return CircularProgressIndicator(color: AppColors.kGray);
      },
    );
  }
}
