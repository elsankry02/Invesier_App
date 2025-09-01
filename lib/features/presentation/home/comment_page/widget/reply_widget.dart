import 'package:flutter/material.dart';

import '../../../../../core/components/coustom_pop_menu_widget.dart';
import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/components/custom_tag_button.dart';
import '../../../../../core/components/show_custom_top_snack_bar.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_images.dart';
import '../../../../../core/constant/app_svgs.dart';
import '../../../../../core/extension/extension.dart';

class ReplyWidget extends StatelessWidget {
  final Function() onTap;
  const ReplyWidget({super.key, required this.onTap});
  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
      child: Column(
        spacing: 16,
        children: [
          Container(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: AppColors.kCodGray,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: ClipOval(
                    // image
                    child: Image.asset(
                      AppImages.kBoyTwo,
                      height: 30,
                      width: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                  trailing: CustomPopMenuWidget(
                    firstSvg: AppSvgs.kPin,
                    secondSvg: AppSvgs.kDelete,
                    firstTitle: local.pinpost,
                    secondTitle: local.deletepost,
                    onFirstTap:
                        () => showCustomErrorMessage(
                          context,
                          message: local.pinaction,
                        ),
                    onSecondTap:
                        () => showCustomErrorMessage(
                          context,
                          message: local.deleteaction,
                        ),
                  ),
                  title: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // title
                          Text(
                            'Fred Blue',
                            style: context.kTextTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          // nk name
                          Text(
                            '@Blue234',
                            style: context.kTextTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: context.width * 0.025),
                      // Custom Primary Button
                      CustomPrimaryButton(
                        title: local.chaseback,
                        style: context.kTextTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                        backGroundColor: AppColors.kTurquoiseBlue,
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        borderRadius: BorderRadius.circular(31),
                      ),
                    ],
                  ),
                ),
                // subTitle
                Text(
                  'Lorem ipsum dolor sit amet, coetur adipiscing \nelit ut aliquam, purus sit amet luctus Lorem \nipsum dolor sit amet aliquam, purus sit amet \nluctus ',
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
                        showCustomErrorMessage(
                          context,
                          message: local.comingsoon,
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
                        showCustomErrorMessage(
                          context,
                          message: local.comingsoon,
                        );
                      },
                    ),
                    CustomTagButton(
                      // Rplay
                      svg: AppSvgs.kReply,
                      title: local.reply,
                      titleColor: AppColors.kBoulder,
                      borderColor: AppColors.kBoulder,
                      onTap: onTap,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
