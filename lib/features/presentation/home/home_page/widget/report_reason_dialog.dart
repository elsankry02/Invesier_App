import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/components/custom_button_widget.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/extension/extension.dart';
import 'package:invesier/features/presentation/home/user_profile_page/widget/user_alertdialog_widget.dart';

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
              CustomButtonWidget(
                title: 'Spam',
                backGroundColor:
                    isSelectedOne == true
                        ? ColorManger.kBoulder
                        : ColorManger.kWhite,
                titleColor:
                    isSelectedOne == false
                        ? ColorManger.kBackGround
                        : ColorManger.kWhite,
                borderColor:
                    isSelectedOne == false
                        ? ColorManger.kTurquoiseBlue
                        : ColorManger.kBoulder,
                horizontal: 101,
                vertical: 4,
                radius: 31,
                onTap: () {
                  setState(() {
                    isSelectedOne = !isSelectedOne;
                  });
                },
              ),
              SizedBox(height: context.height * 0.007),
              CustomButtonWidget(
                title: 'Scam',
                backGroundColor:
                    isSelectedTwo == true
                        ? ColorManger.kBoulder
                        : ColorManger.kWhite,
                titleColor:
                    isSelectedTwo == false
                        ? ColorManger.kBackGround
                        : ColorManger.kWhite,
                borderColor:
                    isSelectedTwo == false
                        ? ColorManger.kTurquoiseBlue
                        : ColorManger.kBoulder,
                horizontal: 101,
                vertical: 4,
                radius: 31,
                onTap: () {
                  setState(() {
                    isSelectedTwo = !isSelectedTwo;
                  });
                },
              ),
              SizedBox(height: context.height * 0.007),
              CustomButtonWidget(
                title: 'Illegal',
                backGroundColor:
                    isSelectedThree == true
                        ? ColorManger.kBoulder
                        : ColorManger.kWhite,
                titleColor:
                    isSelectedThree == false
                        ? ColorManger.kBackGround
                        : ColorManger.kWhite,
                borderColor:
                    isSelectedThree == false
                        ? ColorManger.kTurquoiseBlue
                        : ColorManger.kBoulder,
                horizontal: 100,
                vertical: 4,
                radius: 31,
                onTap: () {
                  setState(() {
                    isSelectedThree = !isSelectedThree;
                  });
                },
              ),
              SizedBox(height: context.height * 0.007),
              CustomButtonWidget(
                title: 'Violence',
                backGroundColor:
                    isSelectedFour == true
                        ? ColorManger.kBoulder
                        : ColorManger.kWhite,
                titleColor:
                    isSelectedFour == false
                        ? ColorManger.kBackGround
                        : ColorManger.kWhite,
                borderColor:
                    isSelectedFour == false
                        ? ColorManger.kTurquoiseBlue
                        : ColorManger.kBoulder,
                horizontal: 92.5,
                vertical: 4,
                radius: 31,
                onTap: () {
                  setState(() {
                    isSelectedFour = !isSelectedFour;
                  });
                },
              ),
              SizedBox(height: context.height * 0.007),
              CustomButtonWidget(
                title: 'Hate speech',
                backGroundColor:
                    isSelectedFive == true
                        ? ColorManger.kBoulder
                        : ColorManger.kWhite,
                titleColor:
                    isSelectedFive == false
                        ? ColorManger.kBackGround
                        : ColorManger.kWhite,
                borderColor:
                    isSelectedFive == false
                        ? ColorManger.kTurquoiseBlue
                        : ColorManger.kBoulder,
                horizontal: 81.5,
                vertical: 4,
                radius: 31,
                onTap: () {
                  setState(() {
                    isSelectedFive = !isSelectedFive;
                  });
                },
              ),
              SizedBox(height: context.height * 0.007),
              CustomButtonWidget(
                title: 'Others',
                backGroundColor:
                    isSelectedSix == true
                        ? ColorManger.kBoulder
                        : ColorManger.kWhite,
                titleColor:
                    isSelectedSix == false
                        ? ColorManger.kBackGround
                        : ColorManger.kWhite,
                borderColor:
                    isSelectedSix == false
                        ? ColorManger.kTurquoiseBlue
                        : ColorManger.kBoulder,
                horizontal: 97.5,
                vertical: 4,
                radius: 31,
                onTap: () {
                  setState(() {
                    isSelectedSix = !isSelectedSix;
                  });
                },
              ),
              SizedBox(height: context.height * 0.022),
              CustomButtonWidget(
                title: 'Submit',
                titleColor: ColorManger.kWhite,
                backGroundColor: ColorManger.kTurquoiseBlue,
                borderColor: ColorManger.kTurquoiseBlue,
                horizontal: 101,
                vertical: 4,
                radius: 31,
                onTap: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return UserAlertDialogWidget(
                        title:
                            'Report is delivered. Do you want to \nblock this account?',
                      );
                    },
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
