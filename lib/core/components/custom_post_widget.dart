import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invesier/core/constant/app_text_theme.dart';

import '../constant/app_colors.dart';
import '../constant/app_images.dart';
import '../constant/app_svgs.dart';
import '../extension/extension.dart';
import '../func/get_time_ago.dart';
import 'custom_circuler_progress.dart';
import 'custom_tag_button.dart';

class CustomPostWidget extends StatelessWidget {
  final DateTime createdAt;
  final String imageUrl,
      name,
      username,
      content,
      postImage,
      growthNumber,
      declineNumber,
      commentNumber;
  final Function()? commentOnTap,
      onSecondTap,
      onFirstTap,
      imageOnTap,
      growthOnTap,
      declineOnTap,
      SharingOnTap;
  final Widget? trailing;

  const CustomPostWidget({
    super.key,
    this.commentOnTap,
    this.imageOnTap,
    this.growthOnTap,
    this.declineOnTap,
    this.trailing,
    this.SharingOnTap,
    required this.imageUrl,

    required this.name,
    required this.username,
    required this.content,
    required this.postImage,
    required this.growthNumber,
    required this.declineNumber,
    required this.commentNumber,

    this.onSecondTap,
    this.onFirstTap,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.kHeavyMetal,
      ),
      padding: EdgeInsets.only(
        bottom: context.height * 0.020,
        left: context.height * 0.020,
        right: context.height * 0.020,
      ),
      margin: EdgeInsets.only(bottom: context.height * 0.010),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ClipOval(
              child: GestureDetector(
                onTap: imageOnTap,
                // imageUrl
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  placeholder:
                      (context, url) => CustomCircularProgressIndicator(),
                  errorWidget:
                      (context, url, error) =>
                          Image.network(AppImages.ImageNetwork),
                  height: context.height * 0.030,
                  width: context.height * 0.030,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          name,
                          style: AppTextTheme.kTitleSmall(
                            context,
                            fontWeight: FontWeight.w600,
                            color: AppColors.kWhite,
                          ),
                        ),
                        Text(
                          " • ${getTimeAgo(createdAt)}",
                          style: AppTextTheme.kLabelLarge(
                            context,
                            fontWeight: FontWeight.w400,
                            color: AppColors.kGray,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      username,
                      style: AppTextTheme.kTitleSmall(
                        context,
                        fontWeight: FontWeight.w400,
                        color: AppColors.kGray,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            trailing: trailing,
          ),
          //
          Text(
            content,
            style: AppTextTheme.kTitleSmall(
              context,
              fontWeight: FontWeight.w500,
              color: AppColors.kWhite,
            ),
          ),
          SizedBox(height: context.height * 0.013),
          ClipRRect(
            borderRadius: BorderRadius.circular(context.height * 0.018),
            child: CachedNetworkImage(
              imageUrl: postImage,
              placeholder: (context, url) => CustomCircularProgressIndicator(),
              errorWidget: (context, url, error) => SizedBox(),
              fit: BoxFit.cover,
            ),
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
                    title: growthNumber,
                    titleColor: AppColors.kNum,
                  ),
                  CustomTagButton(
                    svg: AppSvgs.kDecline,
                    onTap: declineOnTap,
                    title: declineNumber,
                    titleColor: AppColors.kRed,
                  ),
                  CustomTagButton(
                    onTap: commentOnTap,
                    svg: AppSvgs.kComment,
                    title: commentNumber,
                    titleColor: AppColors.kBoulder,
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
