import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/extension/extension.dart';
import '../../user_profile_page/widget/user_alertdialog_widget.dart';

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
                    'Report reasons',
                    style: context.kTextTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.height * 0.012),
              // Spam
              CustomPrimaryButton(
                title: 'Spam',
                backGroundColor:
                    isSelectedOne == true
                        ? AppColors.kBoulder
                        : AppColors.kWhite,

                borderColor:
                    isSelectedOne == false
                        ? AppColors.kTurquoiseBlue
                        : AppColors.kBoulder,
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 101,
                  vertical: 4,
                ),
                radius: 31,
                style: context.kTextTheme.labelMedium!.copyWith(
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
                title: 'Scam',
                backGroundColor:
                    isSelectedTwo == true
                        ? AppColors.kBoulder
                        : AppColors.kWhite,
                borderColor:
                    isSelectedTwo == false
                        ? AppColors.kTurquoiseBlue
                        : AppColors.kBoulder,
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 101,
                  vertical: 4,
                ),
                radius: 31,
                style: context.kTextTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color:
                      isSelectedTwo == false
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
                title: 'Illegal',
                backGroundColor:
                    isSelectedThree == true
                        ? AppColors.kBoulder
                        : AppColors.kWhite,
                borderColor:
                    isSelectedThree == false
                        ? AppColors.kTurquoiseBlue
                        : AppColors.kBoulder,
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 100,
                  vertical: 4,
                ),
                radius: 31,
                style: context.kTextTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color:
                      isSelectedThree == false
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
                title: 'Violence',
                backGroundColor:
                    isSelectedFour == true
                        ? AppColors.kBoulder
                        : AppColors.kWhite,

                borderColor:
                    isSelectedFour == false
                        ? AppColors.kTurquoiseBlue
                        : AppColors.kBoulder,
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 93,
                  vertical: 4,
                ),
                radius: 31,
                style: context.kTextTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color:
                      isSelectedFour == false
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
                title: 'Hate speech',
                backGroundColor:
                    isSelectedFive == true
                        ? AppColors.kBoulder
                        : AppColors.kWhite,

                borderColor:
                    isSelectedFive == false
                        ? AppColors.kTurquoiseBlue
                        : AppColors.kBoulder,
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 81,
                  vertical: 4,
                ),
                radius: 31,
                style: context.kTextTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color:
                      isSelectedFive == false
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
                title: 'Others',
                backGroundColor:
                    isSelectedSix == true
                        ? AppColors.kBoulder
                        : AppColors.kWhite,

                borderColor:
                    isSelectedSix == false
                        ? AppColors.kTurquoiseBlue
                        : AppColors.kBoulder,
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 98,
                  vertical: 4,
                ),
                radius: 31,
                style: context.kTextTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color:
                      isSelectedSix == false
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
                title: 'Submit',
                backGroundColor: AppColors.kTurquoiseBlue,
                borderColor: AppColors.kTurquoiseBlue,
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 101,
                  vertical: 4,
                ),
                radius: 31,
                style: context.kTextTheme.labelMedium!.copyWith(
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
                              'Report is delivered. Do you want to \nblock this account?',
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
