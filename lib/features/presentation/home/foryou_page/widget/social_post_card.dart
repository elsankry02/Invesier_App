import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invesier/features/model/get_posts_model.dart';

import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/components/custom_tag_button.dart';
import '../../../../../core/components/show_custom_top_snack_bar.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_svgs.dart';
import '../../../../../core/extension/extension.dart';

class SocialPostCardWidget extends StatelessWidget {
  final Datum? post;
  final Function()? commentOnTap;
  final Function()? imageOnTap;
  final Widget? trailing;
  const SocialPostCardWidget({
    super.key,
    this.commentOnTap,
    this.imageOnTap,
    this.trailing,
    this.post,
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
      child: Column(
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
                  post!.user.avatarUrl,
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
                      post!.user.name,
                      style: context.kTextTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // nk name
                    Text(
                      post!.user.username,
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
            post!.content,
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
                title: post!.upvotesCount.toString(),
                titleColor: AppColors.kEucalyptus,
                borderColor: AppColors.kEucalyptus,
                onTap: () {
                  showCustomErrorMessage(context, message: local.comingsoon);
                },
              ),
              CustomTagButton(
                // Decline
                svg: AppSvgs.kDecline,
                title: post!.downvotesCount.toString(),
                titleColor: AppColors.kRed,
                borderColor: AppColors.kRed,
                onTap: () {
                  showCustomErrorMessage(context, message: local.comingsoon);
                },
              ),
              CustomTagButton(
                // Comment
                svg: AppSvgs.kComment,
                title: post!.commentsCount.toString(),
                titleColor: AppColors.kBoulder,
                borderColor: AppColors.kBoulder,
                onTap: commentOnTap,
              ),
              // Sharing
              GestureDetector(
                child: SvgPicture.asset(AppSvgs.kSharing),
                onTap: () {
                  showCustomErrorMessage(context, message: local.comingsoon);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
