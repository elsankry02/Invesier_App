import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/components/show_custom_top_snack_bar.dart';
import '../../../../../core/constant/app_images.dart';
import '../../../../model/user_model.dart';

import '../../../../../core/components/custom_tag_button.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_svgs.dart';
import '../../../../../core/extension/extension.dart';

class PersonalPostCardWidget extends StatelessWidget {
  final Function()? commentOnTap;
  final Function()? imageOnTap;
  final Widget? trailing;
  final UserModel userModel;
  const PersonalPostCardWidget({
    super.key,
    this.commentOnTap,
    this.imageOnTap,
    this.trailing,
    required this.userModel,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: AppColors.kHeavyMetal,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ListTile
          ListTile(
            contentPadding: EdgeInsets.all(0),
            // leading
            leading: ClipOval(
              // image
              child: GestureDetector(
                onTap: imageOnTap,
                child: Image.network(
                  fit: BoxFit.cover,
                  height: 30,
                  width: 30,
                  userModel.avatarUrl ?? AppImages.k1,
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
                      userModel.name ?? "Mohamed Ebrahim",
                      style: context.kTextTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // nk name
                    Text(
                      userModel.username ?? "elsankary02",
                      style: context.kTextTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
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
                  showCustomErrorMessage(context, message: "COMING SOON");
                },
              ),
              CustomTagButton(
                // Decline
                svg: AppSvgs.kDecline,
                title: '12K',
                titleColor: AppColors.kRed,
                borderColor: AppColors.kRed,
                onTap: () {
                  showCustomErrorMessage(context, message: "COMING SOON");
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
                  showCustomErrorMessage(context, message: "COMING SOON");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
