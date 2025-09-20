import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'custom_primary_button.dart';
import 'custom_tag_button.dart';
import '../constant/app_colors.dart';
import '../constant/app_svgs.dart';
import '../extension/extension.dart';

class CustomPostWidget extends StatelessWidget {
  final Function()? commentOnTap,
      imageOnTap,
      growthOnTap,
      declineOnTap,
      SharingOnTap;
  final String name, userName, postTitle, imagePost, avatarUrl;
  final int upvotesCount, downvotesCount, commentsCount;
  final Widget? trailing;

  const CustomPostWidget({
    super.key,
    this.commentOnTap,
    this.imageOnTap,
    this.growthOnTap,
    this.declineOnTap,
    this.trailing,
    required this.name,
    required this.userName,
    required this.postTitle,
    required this.avatarUrl,
    required this.upvotesCount,
    required this.downvotesCount,
    required this.commentsCount,
    this.SharingOnTap,
    required this.imagePost,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.kOne,
      ),
      padding: EdgeInsets.all(context.height * 0.020),
      margin: EdgeInsets.only(bottom: context.height * 0.020),
      child: Column(
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
                  title: context.kAppLocalizations.chase,
                  style: context.kTextTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: context.height * 0.020,
                    vertical: context.height * 0.004,
                  ),
                  borderRadius: BorderRadius.circular(context.height * 0.031),
                  backGroundColor: AppColors.kNum,
                ),
              ],
            ),
            subtitle: Text(userName),
            trailing: trailing,
          ),
          Text(postTitle),
          SizedBox(height: context.height * 0.013),
          ClipRRect(
            borderRadius: BorderRadius.circular(context.height * 0.018),
            child: Image.asset(imagePost, fit: BoxFit.cover),
          ),
          SizedBox(height: context.height * 0.013),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: context.height * 0.020,
                children: [
                  CustomTagButton(
                    svg: AppSvgs.kGrowth,
                    onTap: growthOnTap,
                    title: upvotesCount.toString(),
                    titleColor: AppColors.kNum,
                  ),
                  CustomTagButton(
                    svg: AppSvgs.kDecline,
                    onTap: declineOnTap,
                    title: downvotesCount.toString(),
                    titleColor: AppColors.kRed,
                  ),
                  CustomTagButton(
                    onTap: commentOnTap,
                    svg: AppSvgs.kComment,
                    title: commentsCount.toString(),
                    titleColor: AppColors.kGray,
                  ),
                ],
              ),
              GestureDetector(
                child: SvgPicture.asset(AppSvgs.kSharing),
                onTap: SharingOnTap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
