import 'package:flutter/material.dart';

import '../../../../../../core/components/coustom_pop_menu_widget.dart';
import '../../../../../../core/components/custom_primary_button.dart';
import '../../../../../../core/components/custom_tag_button.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/constant/app_svgs.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/func/show_top_snack_bar.dart';

class ReplyPostWidget extends StatelessWidget {
  final Function()? onTap;
  final Function()? commentOnTap,
      imageOnTap,
      growthOnTap,
      declineOnTap,
      SharingOnTap;
  final String name, userName, imagePost, avatarUrl;
  final int upvotesCount, downvotesCount, commentsCount;
  final Widget? trailing;
  const ReplyPostWidget({
    super.key,
    this.onTap,
    this.commentOnTap,
    this.imageOnTap,
    this.growthOnTap,
    this.declineOnTap,
    this.SharingOnTap,
    required this.name,
    required this.userName,
    required this.imagePost,
    required this.avatarUrl,
    required this.upvotesCount,
    required this.downvotesCount,
    required this.commentsCount,
    this.trailing,
  });
  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    return Padding(
      padding: EdgeInsets.only(
        right: context.height * 0.020,
        left: context.height * 0.020,
        bottom: context.height * 0.010,
      ),
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: context.height * 0.020,
          vertical: context.height * 0.012,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: AppColors.kCodGray,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: ClipOval(
                //TODO: Image.network soon
                child: GestureDetector(
                  onTap: imageOnTap,
                  child: Image.asset(
                    avatarUrl,
                    height: context.height * 0.030,
                    width: context.height * 0.030,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Row(
                spacing: context.height * 0.020,
                children: [
                  Text(name),
                  CustomPrimaryButton(
                    title: context.kAppLocalizations.chaseback,
                    style: context.kTextTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: context.height * 0.020,
                      vertical: context.height * 0.004,
                    ),
                    borderRadius: BorderRadius.circular(context.height * 0.031),
                    border: Border.all(color: AppColors.kNum),
                  ),
                ],
              ),
              subtitle: Text(userName),
              trailing: CustomPopMenuWidget(
                firstSvg: AppSvgs.kPin,
                secondSvg: AppSvgs.kDelete,
                firstTitle: local.pinpost,
                secondTitle: local.deletepost,
                onFirstTap:
                    () => ErrorMessage(context, message: local.pinaction),
                onSecondTap:
                    () => ErrorMessage(context, message: local.deleteaction),
              ),
            ),
            Text(
              'Lorem ipsum dolor sit amet, coetur adipiscing \nelit ut aliquam, purus sit amet luctus Lorem \nipsum dolor sit amet aliquam, purus sit amet \nluctus ',
              style: context.kTextTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: context.height * 0.013),
            ClipRRect(
              borderRadius: BorderRadius.circular(context.height * 0.018),
              child: Image.asset(imagePost, fit: BoxFit.cover),
            ),
            SizedBox(height: context.height * 0.013),
            Row(
              spacing: context.height * 0.020,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Growth
                CustomTagButton(
                  svg: AppSvgs.kGrowth,
                  title: '12k',
                  titleColor: AppColors.kEucalyptus,
                  onTap: () {
                    ErrorMessage(context, message: local.comingsoon);
                  },
                ),
                CustomTagButton(
                  // Decline
                  svg: AppSvgs.kDecline,
                  title: '12K',
                  titleColor: AppColors.kRed,
                  onTap: () {
                    ErrorMessage(context, message: local.comingsoon);
                  },
                ),
                CustomTagButton(
                  // Rplay
                  svg: AppSvgs.kReply,
                  title: local.reply,
                  titleColor: AppColors.kBoulder,
                  onTap: onTap,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
