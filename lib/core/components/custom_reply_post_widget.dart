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

class CustomReplyPostWidget extends StatelessWidget {
  final String imageUrl,
      chaseButtonTitle,
      name,
      username,
      content,
      postImage,
      growthNumber,
      declineNumber;
  final void Function()? deleteOnTap,
      pinOnTap,
      chaseButtonOnTap,
      imageOnTap,
      growthOnTap,
      declineOnTap,
      replyOnTap;
  final Color? backGroundColor;
  final Color borderColor;
  final Widget? trailing;
  const CustomReplyPostWidget({
    super.key,
    this.imageOnTap,
    this.growthOnTap,
    this.declineOnTap,
    this.replyOnTap,
    this.trailing,
    required this.imageUrl,
    this.chaseButtonTitle = "",
    required this.name,
    required this.username,
    required this.content,
    required this.postImage,
    required this.growthNumber,
    required this.declineNumber,
    this.chaseButtonOnTap,
    this.backGroundColor,
    this.borderColor = Colors.transparent,
    this.deleteOnTap,
    this.pinOnTap,
  });

  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    return Padding(
      padding: EdgeInsets.only(
        bottom: context.height * 0.008,
        left: context.height * 0.020,
        right: context.height * 0.020,
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
                child: GestureDetector(
                  onTap: imageOnTap,
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
                  Text(name),
                  InkWell(
                    onTap: chaseButtonOnTap,
                    child: CustomPrimaryButton(
                      title: chaseButtonTitle,
                      style: context.kTextTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: context.height * 0.020,
                        vertical: context.height * 0.004,
                      ),
                      borderRadius: BorderRadius.circular(
                        context.height * 0.031,
                      ),
                      border: Border.all(width: 2, color: borderColor),
                      backGroundColor: backGroundColor,
                    ),
                  ),
                ],
              ),
              subtitle: Text(username),
              trailing: PopupMenuButton(
                padding: EdgeInsets.zero,
                offset: const Offset(0, 35),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                icon: SvgPicture.asset(AppSvgs.kPopMenu),
                color: AppColors.kHeavyMetal,
                iconColor: AppColors.kWhite,
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      padding: EdgeInsets.zero,
                      onTap: deleteOnTap,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppSvgs.kDelete),
                          SizedBox(width: context.height * 0.007),
                          Text(
                            context.kAppLocalizations.delete,
                            style: context.kTextTheme.labelLarge!.copyWith(
                              color: AppColors.kRed,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ];
                },
              ),
            ),
            Text(
              content,
              style: context.kTextTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: context.height * 0.013),
            ClipRRect(
              borderRadius: BorderRadius.circular(context.height * 0.018),
              child: CachedNetworkImage(
                imageUrl: postImage,
                placeholder:
                    (context, url) => CustomCircularProgressIndicator(),
                errorWidget: (context, url, error) => SizedBox(),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: context.height * 0.013),
            Row(
              spacing: context.height * 0.020,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Growth
                CustomTagButton(
                  svg: AppSvgs.kGrowth,
                  title: growthNumber,
                  titleColor: AppColors.kEucalyptus,
                  onTap: growthOnTap,
                ),
                CustomTagButton(
                  // Decline
                  svg: AppSvgs.kDecline,
                  title: declineNumber,
                  titleColor: AppColors.kRed,
                  onTap: declineOnTap,
                ),
                CustomTagButton(
                  // Reply
                  svg: AppSvgs.kReply,
                  title: local.reply,
                  titleColor: AppColors.kBoulder,
                  onTap: replyOnTap,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
