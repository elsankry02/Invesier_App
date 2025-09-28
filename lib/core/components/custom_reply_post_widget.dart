import 'package:flutter/material.dart';

import 'coustom_pop_menu_widget.dart';
import 'custom_primary_button.dart';
import 'custom_tag_button.dart';
import '../constant/app_colors.dart';
import '../constant/app_svgs.dart';
import '../extension/extension.dart';
import '../func/show_top_snack_bar.dart';

class CustomReplyPostWidget extends StatefulWidget {
  final Function()? onTap;
  final Function()? commentOnTap,
      imageOnTap,
      growthOnTap,
      declineOnTap,
      SharingOnTap;
  final Widget? trailing;
  const CustomReplyPostWidget({
    super.key,
    this.onTap,
    this.commentOnTap,
    this.imageOnTap,
    this.growthOnTap,
    this.declineOnTap,
    this.SharingOnTap,
    this.trailing,
  });

  @override
  State<CustomReplyPostWidget> createState() => _CustomReplyPostWidgetState();
}

class _CustomReplyPostWidgetState extends State<CustomReplyPostWidget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    return Padding(
      padding: EdgeInsets.only(
        bottom: context.height * 0.020,
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
                //TODO: Image.network soon
                child: GestureDetector(
                  
                  onTap: widget.imageOnTap,
                  child: Image.asset(
                    '',
                    height: context.height * 0.030,
                    width: context.height * 0.030,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Row(
                spacing: context.height * 0.020,
                children: [
                  Text(''),
                  InkWell(
                    onTap: () {
                      if (isSelected == false) {
                        SuccessMessage(
                          context,
                          message: context.kAppLocalizations.chaseback,
                        );
                        setState(() {
                          isSelected = !isSelected;
                        });
                      } else {
                        SuccessMessage(
                          context,
                          message: context.kAppLocalizations.chase,
                        );

                        setState(() {
                          isSelected = !isSelected;
                        });
                      }
                    },
                    child: CustomPrimaryButton(
                      title:
                          isSelected == false
                              ? context.kAppLocalizations.chase
                              : context.kAppLocalizations.chaseback,
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
                      border: Border.all(
                        width: 2,
                        color:
                            isSelected == true
                                ? AppColors.kNum
                                : Colors.transparent,
                      ),
                      backGroundColor:
                          isSelected == true
                              ? Colors.transparent
                              : AppColors.kNum,
                    ),
                  ),
                ],
              ),
              subtitle: Text(''),
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
              '',
              style: context.kTextTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: context.height * 0.013),
            ClipRRect(
              borderRadius: BorderRadius.circular(context.height * 0.018),
              child: Image.asset('', fit: BoxFit.cover),
            ),
            SizedBox(height: context.height * 0.013),
            Row(
              spacing: context.height * 0.020,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Growth
                CustomTagButton(
                  svg: AppSvgs.kGrowth,
                  title: '',
                  titleColor: AppColors.kEucalyptus,
                  onTap: () {
                    ErrorMessage(context, message: local.comingsoon);
                  },
                ),
                CustomTagButton(
                  // Decline
                  svg: AppSvgs.kDecline,
                  title: '',
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
                  onTap: widget.onTap,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
