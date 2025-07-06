import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constant/color_manger.dart';
import '../../../../../core/extension/extension.dart';

class NotificationAppBarWidget extends StatelessWidget {
  const NotificationAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // icon
        IconButton(
          onPressed: () {
            context.router.maybePop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ColorManger.kWhite,
          ),
        ),
        // title
        Expanded(
          child: Text(
            textAlign: TextAlign.center,
            'Notification',
            style: context.kTextTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
