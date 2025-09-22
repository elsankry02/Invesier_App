import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invesier/core/func/show_top_snack_bar.dart';

import '../constant/app_colors.dart';
import '../constant/app_svgs.dart';
import '../extension/extension.dart';
import 'custom_primary_button.dart';
import 'custom_tag_button.dart';

class CustomPostWidget extends StatefulWidget {
  final Function()? commentOnTap,
      imageOnTap,
      growthOnTap,
      declineOnTap,
      SharingOnTap;
  final Widget? trailing;
  final void Function()? onTap;

  const CustomPostWidget({
    super.key,
    this.commentOnTap,
    this.imageOnTap,
    this.growthOnTap,
    this.declineOnTap,
    this.trailing,
    this.SharingOnTap,
    this.onTap,
  });

  @override
  State<CustomPostWidget> createState() => _CustomPostWidgetState();
}

class _CustomPostWidgetState extends State<CustomPostWidget> {
  bool isSelected = false;
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
      margin: EdgeInsets.only(bottom: context.height * 0.020),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: ClipOval(
              //TODO:
              child: GestureDetector(
                onTap: widget.imageOnTap,
                child: Image.asset(
                  "",
                  height: context.height * 0.030,
                  width: context.height * 0.030,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Row(
              spacing: context.height * 0.020,
              children: [
                Text(""),
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
                    borderRadius: BorderRadius.circular(context.height * 0.031),
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
            subtitle: Text(""),
            trailing: widget.trailing,
          ),
          Text(""),
          SizedBox(height: context.height * 0.013),
          ClipRRect(
            borderRadius: BorderRadius.circular(context.height * 0.018),
            child: Image.asset("", fit: BoxFit.cover),
          ),
          SizedBox(height: context.height * 0.013),
          Row(
            spacing: context.height * 0.020,
            children: [
              CustomTagButton(
                svg: AppSvgs.kGrowth,
                onTap: widget.growthOnTap,
                title: "5",
                titleColor: AppColors.kNum,
              ),
              CustomTagButton(
                svg: AppSvgs.kDecline,
                onTap: widget.declineOnTap,
                title: "5",
                titleColor: AppColors.kRed,
              ),
              CustomTagButton(
                onTap: widget.commentOnTap,
                svg: AppSvgs.kComment,
                title: "5",
                titleColor: AppColors.kBoulder,
              ),
              GestureDetector(
                child: SvgPicture.asset(AppSvgs.kSharing),
                onTap: widget.SharingOnTap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
