import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/components/custom_button_widget.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/extension/extension.dart';

class UserAlertDialogWidget extends StatelessWidget {
  const UserAlertDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorManger.kCodGray,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            // close back
            child: IconButton(
              onPressed: () {
                context.router.maybePop();
              },
              icon: Icon(Icons.close, color: ColorManger.kWhite, size: 20),
            ),
          ),
          SizedBox(height: context.height * 0.014),
          Text(
            'Are you sure you want to block this \naccount?',
            style: context.kTextTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: context.height * 0.020),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButtonWidget(
                title: 'No',
                titleColor: ColorManger.kWhite,
                backGroundColor: ColorManger.kBackGround,
                vertical: 6,
                horizontal: 34,
                radius: 31,
                onTap: () {
                  context.router.maybePop();
                },
              ),
              CustomButtonWidget(
                title: 'Yes, block',
                titleColor: ColorManger.kWhite,
                backGroundColor: ColorManger.kRedTwo,
                vertical: 6,
                horizontal: 27.5,
                radius: 31,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
