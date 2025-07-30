import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/components/custom_tag_button.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_images.dart';
import '../../../../../core/constant/app_svgs.dart';
import '../../../../../core/extension/extension.dart';

class PostCardWidget extends StatelessWidget {
  final Function()? commentOnTap;
  final Function()? imageOnTap;
  final Widget? trailing;
  const PostCardWidget({
    super.key,
    this.commentOnTap,
    this.imageOnTap,
    this.trailing,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 10),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 12),
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
            contentPadding: EdgeInsets.all(0),
            // leading
            leading: ClipOval(
              // image
              child: GestureDetector(
                onTap: imageOnTap,
                child: Image.asset(
                  fit: BoxFit.cover,
                  height: 30,
                  width: 30,
                  AppImages.kBoyThree,
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
                      'Charlie White',
                      style: context.kTextTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // nk name
                    Text(
                      '@charlie_w',
                      style: context.kTextTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: context.width * 0.025),
                // Custom Primary Button
                CustomPrimaryButton(
                  title: 'Mate',
                  radius: 31,
                  style: context.kTextTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  borderColor: AppColors.kTurquoiseBlue,
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 24,
                    vertical: 4,
                  ),
                ),
              ],
            ),
          ),
          // subTitle
          Text(
            'Green energy stocks are gaining traction. Investing \nin sustainable companies could be beneficial in the \nlong run.',
            style: context.kTextTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: context.height * 0.015),
          // Custom Trend Box
          Row(
            spacing: 13,
            children: [
              // Growth
              CustomTagButton(
                svg: AppSvgs.kGrowth,
                title: '12k',
                titleColor: AppColors.kEucalyptus,
                borderColor: AppColors.kEucalyptus,
                onTap: () {
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.info(
                      backgroundColor: AppColors.kTurquoiseBlue,
                      message: "COMING SOON",
                    ),
                  );
                },
              ),
              CustomTagButton(
                // Decline
                svg: AppSvgs.kDecline,
                title: '12K',
                titleColor: AppColors.kRed,
                borderColor: AppColors.kRed,
                onTap: () {
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.info(
                      backgroundColor: AppColors.kRedTwo,
                      message: "COMING SOON",
                    ),
                  );
                },
              ),
              CustomTagButton(
                // Comment
                svg: AppSvgs.kComment,
                title: '160K',
                titleColor: AppColors.kBoulder,
                borderColor: AppColors.kBoulder,
                onTap: commentOnTap,
              ),
              // Sharing
              GestureDetector(
                child: SvgPicture.asset(AppSvgs.kSharing),
                onTap: () {
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.info(
                      backgroundColor: AppColors.kBoulder,
                      message: "COMING SOON",
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
