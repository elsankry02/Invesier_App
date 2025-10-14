import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/constant/app_text_theme.dart';

import '../../../../../../core/components/custom_primary_button.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/extension/extension.dart';
import '../../user_profile/widget/user_alertdialog_widget.dart';

class ReportReasonDialog extends StatefulWidget {
  const ReportReasonDialog({super.key});

  @override
  State<ReportReasonDialog> createState() => _ReportReasonDialogState();
}

class _ReportReasonDialogState extends State<ReportReasonDialog> {
  bool isSelectedOne = true;
  bool isSelectedTwo = true;
  bool isSelectedThree = true;
  bool isSelectedFour = true;
  bool isSelectedFive = true;
  bool isSelectedSix = true;
  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    context.router.maybePop();
                  },
                  icon: Icon(Icons.close, color: AppColors.kWhite, size: 20),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    local.reportreasons,
                    style: AppTextTheme.kTitleSmall(
                      context,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.height * 0.012),
              // Spam
              CustomPrimaryButton(
                title: local.spam,
                backGroundColor:
                    isSelectedOne == true
                        ? AppColors.kBoulder
                        : AppColors.kWhite,

                border: BoxBorder.all(
                  color:
                      isSelectedOne == false
                          ? AppColors.kTurquoiseBlue
                          : AppColors.kBoulder,
                ),
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: context.height * 0.101,
                  vertical: context.height * 0.004,
                ),
                borderRadius: BorderRadius.circular(31),
                style: AppTextTheme.kLabelMedium(
                  context,
                  fontWeight: FontWeight.w500,
                  color:
                      isSelectedOne == false
                          ? AppColors.kBackGround
                          : AppColors.kWhite,
                ),
                onTap: () {
                  setState(() {
                    isSelectedOne = !isSelectedOne;
                  });
                },
              ),
              SizedBox(height: context.height * 0.007),
              // Scam
              CustomPrimaryButton(
                title: local.scam,
                backGroundColor:
                    isSelectedTwo == true
                        ? AppColors.kBoulder
                        : AppColors.kWhite,
                border: BoxBorder.all(
                  color:
                      isSelectedTwo == false
                          ? AppColors.kTurquoiseBlue
                          : AppColors.kBoulder,
                ),
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: context.height * 0.101,
                  vertical: context.height * 0.004,
                ),
                borderRadius: BorderRadius.circular(31),
                style: AppTextTheme.kLabelMedium(
                  context,
                  fontWeight: FontWeight.w500,
                  color:
                      isSelectedOne == false
                          ? AppColors.kBackGround
                          : AppColors.kWhite,
                ),
                onTap: () {
                  setState(() {
                    isSelectedTwo = !isSelectedTwo;
                  });
                },
              ),
              SizedBox(height: context.height * 0.007),
              // Illegal
              CustomPrimaryButton(
                title: local.illegal,
                backGroundColor:
                    isSelectedThree == true
                        ? AppColors.kBoulder
                        : AppColors.kWhite,
                border: BoxBorder.all(
                  color:
                      isSelectedThree == false
                          ? AppColors.kTurquoiseBlue
                          : AppColors.kBoulder,
                ),
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: context.height * 0.100,
                  vertical: context.height * 0.004,
                ),
                borderRadius: BorderRadius.circular(31),
                style: AppTextTheme.kLabelMedium(
                  context,
                  fontWeight: FontWeight.w500,
                  color:
                      isSelectedOne == false
                          ? AppColors.kBackGround
                          : AppColors.kWhite,
                ),
                onTap: () {
                  setState(() {
                    isSelectedThree = !isSelectedThree;
                  });
                },
              ),
              SizedBox(height: context.height * 0.007),
              // Violence
              CustomPrimaryButton(
                title: local.violence,
                backGroundColor:
                    isSelectedFour == true
                        ? AppColors.kBoulder
                        : AppColors.kWhite,

                border: BoxBorder.all(
                  color:
                      isSelectedFour == false
                          ? AppColors.kTurquoiseBlue
                          : AppColors.kBoulder,
                ),
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: context.height * 0.093,
                  vertical: context.height * 0.004,
                ),
                borderRadius: BorderRadius.circular(31),
                style: AppTextTheme.kLabelMedium(
                  context,
                  fontWeight: FontWeight.w500,
                  color:
                      isSelectedOne == false
                          ? AppColors.kBackGround
                          : AppColors.kWhite,
                ),
                onTap: () {
                  setState(() {
                    isSelectedFour = !isSelectedFour;
                  });
                },
              ),
              SizedBox(height: context.height * 0.007),
              // Hate speech
              CustomPrimaryButton(
                title: local.hatespeech,
                backGroundColor:
                    isSelectedFive == true
                        ? AppColors.kBoulder
                        : AppColors.kWhite,

                border: BoxBorder.all(
                  color:
                      isSelectedFive == false
                          ? AppColors.kTurquoiseBlue
                          : AppColors.kBoulder,
                ),
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: context.height * 0.081,
                  vertical: context.height * 0.004,
                ),
                borderRadius: BorderRadius.circular(31),
                style: AppTextTheme.kLabelMedium(
                  context,
                  fontWeight: FontWeight.w500,
                  color:
                      isSelectedOne == false
                          ? AppColors.kBackGround
                          : AppColors.kWhite,
                ),
                onTap: () {
                  setState(() {
                    isSelectedFive = !isSelectedFive;
                  });
                },
              ),
              SizedBox(height: context.height * 0.007),
              // Others
              CustomPrimaryButton(
                title: local.others,
                backGroundColor:
                    isSelectedSix == true
                        ? AppColors.kBoulder
                        : AppColors.kWhite,

                border: BoxBorder.all(
                  color:
                      isSelectedSix == false
                          ? AppColors.kTurquoiseBlue
                          : AppColors.kBoulder,
                ),

                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: context.height * 0.098,
                  vertical: context.height * 0.004,
                ),
                borderRadius: BorderRadius.circular(31),
                style: AppTextTheme.kLabelMedium(
                  context,
                  fontWeight: FontWeight.w500,
                  color:
                      isSelectedOne == false
                          ? AppColors.kBackGround
                          : AppColors.kWhite,
                ),
                onTap: () {
                  setState(() {
                    isSelectedSix = !isSelectedSix;
                  });
                },
              ),
              SizedBox(height: context.height * 0.022),
              // Submit
              CustomPrimaryButton(
                title: local.submit,
                backGroundColor: AppColors.kTurquoiseBlue,
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: context.height * 0.101,
                  vertical: context.height * 0.004,
                ),
                borderRadius: BorderRadius.circular(31),
                style: AppTextTheme.kLabelMedium(
                  context,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kWhite,
                ),
                onTap: () async {
                  await context.router.maybePop();
                  if (context.mounted) {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        // User Alert Dialog Widget
                        return UserAlertDialogWidget(
                          title:
                              local
                                  .reportisdelivereddoyouwanttoblockthisaccount,
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
