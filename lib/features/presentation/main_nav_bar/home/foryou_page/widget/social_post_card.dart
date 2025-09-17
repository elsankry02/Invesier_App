import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/components/custom_circuler_progress.dart';
import '../../../../../data/providers/get/get_posts_provider.dart';

import '../../../../../../core/components/custom_primary_button.dart';
import '../../../../../../core/components/custom_tag_button.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/constant/app_svgs.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/func/show_top_snack_bar.dart';

class SocialPostCardWidget extends StatelessWidget {
  final Function()? commentOnTap;
  final Function()? imageOnTap;
  final Widget? trailing;
  const SocialPostCardWidget({
    super.key,
    this.commentOnTap,
    this.imageOnTap,
    this.trailing,
  });
  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: context.height * 0.010),
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: context.height * 0.020,
        vertical: context.height * 0.012,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: AppColors.kHeavyMetal,
      ),
      child: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(getPostsProvider);
          if (state is GetPostsSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ListTile
                ListTile(
                  // contentPadding
                  contentPadding: EdgeInsets.zero,
                  // leading
                  leading: ClipOval(
                    // image
                    child: GestureDetector(
                      onTap: imageOnTap,
                      child: Image.network(
                        fit: BoxFit.cover,
                        height: context.height * 0.030,
                        width: context.height * 0.030,
                        state.data.first.user.avatarUrl,
                      ),
                    ),
                  ),
                  // User Pop Menu
                  trailing: trailing,
                  // title
                  title: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // title
                          Text(
                            state.data.first.user.name,
                            style: context.kTextTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          // nk name
                          Text(
                            state.data.first.user.username,
                            style: context.kTextTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: context.width * 0.025),
                      // Custom Primary Button
                      CustomPrimaryButton(
                        title: local.mate,
                        borderRadius: BorderRadius.circular(31),
                        style: context.kTextTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                        border: Border.all(color: AppColors.kTurquoiseBlue),
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: context.height * 0.024,
                          vertical: context.height * 0.004,
                        ),
                      ),
                    ],
                  ),
                ),
                // subTitle
                Text(
                  state.data.first.content,
                  style: context.kTextTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: context.height * 0.015),
                // Custom Trend Box
                Row(
                  spacing: context.height * 0.013,
                  children: [
                    // Growth
                    CustomTagButton(
                      svg: AppSvgs.kGrowth,
                      title: state.data.first.upvotesCount.toString(),
                      titleColor: AppColors.kEucalyptus,
                      borderColor: AppColors.kEucalyptus,
                      onTap: () {
                        ErrorMessage(context, message: local.comingsoon);
                      },
                    ),
                    CustomTagButton(
                      // Decline
                      svg: AppSvgs.kDecline,
                      title: state.data.first.downvotesCount.toString(),
                      titleColor: AppColors.kRed,
                      borderColor: AppColors.kRed,
                      onTap: () {
                        ErrorMessage(context, message: local.comingsoon);
                      },
                    ),
                    CustomTagButton(
                      // Comment
                      svg: AppSvgs.kComment,
                      title: state.data.first.commentsCount.toString(),
                      titleColor: AppColors.kBoulder,
                      borderColor: AppColors.kBoulder,
                      onTap: commentOnTap,
                    ),
                    // Sharing
                    GestureDetector(
                      child: SvgPicture.asset(AppSvgs.kSharing),
                      onTap: () {
                        ErrorMessage(context, message: local.comingsoon);
                      },
                    ),
                  ],
                ),
              ],
            );
          } else if (state is GetPostsFailure) {
            return ErrorMessage(context, message: state.errMessage);
          }
          return CustomCircularProgressIndicator();
        },
      ),
    );
  }
}
