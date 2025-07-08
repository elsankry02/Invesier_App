import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/constant/color_manger.dart';
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
                  icon: Icon(Icons.close, color: ColorManger.kWhite, size: 20),
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
                        ? ColorManger.kBoulder
                        : ColorManger.kWhite,

                borderColor:
                    isSelectedOne == false
                        ? ColorManger.kTurquoiseBlue
                        : ColorManger.kBoulder,
                paddingHorizontal: 101,
                paddingVertical: 4,
                marginHorizontal: 0,
                radius: 31,
                style: context.kTextTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color:
                      isSelectedOne == false
                          ? ColorManger.kBackGround
                          : ColorManger.kWhite,
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
                        ? ColorManger.kBoulder
                        : ColorManger.kWhite,
                borderColor:
                    isSelectedTwo == false
                        ? ColorManger.kTurquoiseBlue
                        : ColorManger.kBoulder,
                paddingHorizontal: 101,
                paddingVertical: 4,
                marginHorizontal: 0,
                radius: 31,
                style: context.kTextTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color:
                      isSelectedTwo == false
                          ? ColorManger.kBackGround
                          : ColorManger.kWhite,
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
                        ? ColorManger.kBoulder
                        : ColorManger.kWhite,
                borderColor:
                    isSelectedThree == false
                        ? ColorManger.kTurquoiseBlue
                        : ColorManger.kBoulder,
                paddingHorizontal: 100,
                paddingVertical: 4,
                marginHorizontal: 0,
                radius: 31,
                style: context.kTextTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color:
                      isSelectedThree == false
                          ? ColorManger.kBackGround
                          : ColorManger.kWhite,
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
                        ? ColorManger.kBoulder
                        : ColorManger.kWhite,

                borderColor:
                    isSelectedFour == false
                        ? ColorManger.kTurquoiseBlue
                        : ColorManger.kBoulder,
                paddingHorizontal: 92.5,
                paddingVertical: 4,
                marginHorizontal: 0,
                radius: 31,
                style: context.kTextTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color:
                      isSelectedFour == false
                          ? ColorManger.kBackGround
                          : ColorManger.kWhite,
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
                        ? ColorManger.kBoulder
                        : ColorManger.kWhite,

                borderColor:
                    isSelectedFive == false
                        ? ColorManger.kTurquoiseBlue
                        : ColorManger.kBoulder,
                paddingHorizontal: 81.5,
                paddingVertical: 4,
                marginHorizontal: 0,
                radius: 31,
                style: context.kTextTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color:
                      isSelectedFive == false
                          ? ColorManger.kBackGround
                          : ColorManger.kWhite,
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
                        ? ColorManger.kBoulder
                        : ColorManger.kWhite,

                borderColor:
                    isSelectedSix == false
                        ? ColorManger.kTurquoiseBlue
                        : ColorManger.kBoulder,
                paddingHorizontal: 97.5,
                paddingVertical: 4,
                marginHorizontal: 0,
                radius: 31,
                style: context.kTextTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color:
                      isSelectedSix == false
                          ? ColorManger.kBackGround
                          : ColorManger.kWhite,
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
                backGroundColor: ColorManger.kTurquoiseBlue,
                borderColor: ColorManger.kTurquoiseBlue,
                paddingHorizontal: 101,
                paddingVertical: 4,
                marginHorizontal: 0,
                radius: 31,
                style: context.kTextTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: ColorManger.kWhite,
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
