import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invesier/core/components/custom_circuler_progress.dart';
import 'package:invesier/core/constant/app_images.dart';

import '../constant/app_colors.dart';
import '../constant/app_svgs.dart';
import '../extension/extension.dart';
import 'custom_primary_button.dart';
import 'custom_tag_button.dart';

class CustomPostWidget extends StatelessWidget {
  final String imageUrl,
      chaseButton,
      name,
      username,
      content,
      postImage,
      growth,
      decline,
      comment;
  final Function()? commentOnTap,
      onTapChase,
      imageOnTap,
      growthOnTap,
      declineOnTap,
      SharingOnTap;
  final Widget? trailing;
  final void Function()? onTap;
  final Color? backGroundColor;
  final Color borderColor;

  const CustomPostWidget({
    super.key,
    this.commentOnTap,
    this.imageOnTap,
    this.growthOnTap,
    this.declineOnTap,
    this.trailing,
    this.SharingOnTap,
    this.onTap,
    required this.imageUrl,
    this.onTapChase,
    required this.name,
    required this.username,
    required this.content,
    required this.postImage,
    required this.growth,
    required this.decline,
    required this.comment,
    this.chaseButton = "",
    this.borderColor = Colors.transparent,
    this.backGroundColor,
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
              spacing: context.height * 0.020,
              children: [
                // name
                Text(
                  name,
                  style: context.kTextTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.kWhite,
                  ),
                ),
                InkWell(
                  onTap: onTapChase,
                  child: CustomPrimaryButton(
                    title: chaseButton,
                    style: context.kTextTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: context.height * 0.020,
                      vertical: context.height * 0.004,
                    ),
                    borderRadius: BorderRadius.circular(context.height * 0.031),
                    border: Border.all(width: 2, color: borderColor),
                    backGroundColor: backGroundColor,
                  ),
                ),
              ],
            ),
            // username
            subtitle: Text(
              username,
              style: context.kTextTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.kPostUsername,
              ),
            ),
            trailing: trailing,
          ),
          //
          Text(
            content,
            style: context.kTextTheme.titleSmall!.copyWith(
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
            spacing: context.height * 0.020,
            children: [
              CustomTagButton(
                svg: AppSvgs.kGrowth,
                onTap: growthOnTap,
                title: "$growth",
                titleColor: AppColors.kNum,
              ),
              CustomTagButton(
                svg: AppSvgs.kDecline,
                onTap: declineOnTap,
                title: "$decline",
                titleColor: AppColors.kRed,
              ),
              CustomTagButton(
                onTap: commentOnTap,
                svg: AppSvgs.kComment,
                title: "$comment",
                titleColor: AppColors.kBoulder,
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
