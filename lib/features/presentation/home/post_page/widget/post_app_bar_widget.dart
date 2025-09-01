import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/components/custom_icon_button.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/extension/extension.dart';

class PostAppBarWidget extends StatelessWidget {
  const PostAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // titel
        Text(
          local.addpost,
          style: context.kTextTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        // icon
        CustomIconButton(
          icon: Icon(FontAwesomeIcons.xmark, color: AppColors.kWhite),
          onPressed: () {
            context.router.maybePop();
          },
        ),
      ],
    );
  }
}
