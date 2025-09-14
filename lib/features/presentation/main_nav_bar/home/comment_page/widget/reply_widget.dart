import 'package:flutter/material.dart';

import '../../../../../../core/components/coustom_pop_menu_widget.dart';
import '../../../../../../core/components/custom_primary_button.dart';
import '../../../../../../core/components/custom_tag_button.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/constant/app_images.dart';
import '../../../../../../core/constant/app_svgs.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/func/show_top_snack_bar.dart';

class ReplyWidget extends StatelessWidget {
  final Function() onTap;
  const ReplyWidget({super.key, required this.onTap});
  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    return Padding(
      padding: EdgeInsets.only(
        right: context.height * 0.020,
        left: context.height * 0.020,
        bottom: context.height * 0.010,
      ),
      child: Column(
        spacing: 16,
        children: [
          Container(
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
                    // image
                    child: Image.asset(
                      AppImages.kBoyTwo,
                      height: context.height * 0.030,
                      width: context.height * 0.030,
                      fit: BoxFit.cover,
                    ),
                  ),
                  trailing: CustomPopMenuWidget(
                    firstSvg: AppSvgs.kPin,
                    secondSvg: AppSvgs.kDelete,
                    firstTitle: local.pinpost,
                    secondTitle: local.deletepost,
                    onFirstTap:
                        () => ErrorMessage(context, message: local.pinaction),
                    onSecondTap:
                        () =>
                            ErrorMessage(context, message: local.deleteaction),
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
                          horizontal: 0.010,
                          vertical: 0.004,
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
                        ErrorMessage(context, message: local.comingsoon);
                      },
                    ),
                    CustomTagButton(
                      // Decline
                      svg: AppSvgs.kDecline,
                      title: '12K',
                      titleColor: AppColors.kRed,
                      borderColor: AppColors.kRed,
                      onTap: () {
                        ErrorMessage(context, message: local.comingsoon);
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
