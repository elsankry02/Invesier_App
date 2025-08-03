import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/components/custom_icon_button.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_images.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/router/router.dart';
import '../../../../provider/get/get_authenticated_user_provider.dart';
import '../../home_follow_page/view/home_follow_page.dart';
import '../../home_page/widget/divider_widget.dart';
import '../../home_page/widget/following_number_widget.dart';

class PersonalAppBarWidget extends StatelessWidget {
  const PersonalAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(getAuthenticatedUserProvider);
        if (state is GetAuthenticatedUserSuccess) {
          final user = state.userModel;
          return ListTile(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Custom Icon Back
                CustomIconButton(
                  icon: Icon(Icons.arrow_back_ios, color: AppColors.kWhite),
                  onPressed: () {
                    context.router.maybePop();
                  },
                ),
                // Image
                ClipOval(
                  child: Image.network(
                    user.avatarUrl ?? AppImages.k1,
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
                  user.name ?? "Mohamed Ebrahim",
                  style: context.kTextTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // subTitle
                Text(
                  user.username ?? "elsankary02",
                  style: context.kTextTheme.labelMedium!.copyWith(
                    color: AppColors.kGray,
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
                FollowingNumberWidget(title: 'Posts', number: user.postsCount),
                // DividerWidget
                DividerWidget(height: context.height * 0.030, width: 1.5),
                // Fans
                FollowingNumberWidget(
                  number: state.userModel.fansCount,
                  title: 'Fans',
                  onTap: () {
                    context.router.push(
                      HomeFollowRoute(initialTab: FollowTabType.fans),
                    );
                  },
                ),
                // DividerWidget
                DividerWidget(height: context.height * 0.030, width: 1.5),
                // Pioneers
                FollowingNumberWidget(
                  number: user.pioneersCount,
                  title: 'Pioneers',
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
        return SizedBox();
      },
    );
  }
}
