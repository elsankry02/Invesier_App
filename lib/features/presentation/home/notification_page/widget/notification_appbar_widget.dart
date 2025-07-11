import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/custom_icon_button.dart';
import '../../../../../core/constant/color_manger.dart';
import '../../../../../core/extension/extension.dart';

class NotificationAppBarWidget extends StatelessWidget {
  const NotificationAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // icon
        CustomIconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ColorManger.kWhite,
          ),
          onPressed: () {
            context.router.maybePop();
          },
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
