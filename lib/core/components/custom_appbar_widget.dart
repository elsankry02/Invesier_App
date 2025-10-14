import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/constant/app_text_theme.dart';

import '../constant/app_colors.dart';
import 'custom_icon_button.dart';

class CustomAppBarWidget extends ConsumerWidget {
  final String title;

  final void Function()? onPressed;
  const CustomAppBarWidget({
    super.key,
    required this.onPressed,
    required this.title,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        // title
        Text(
          textAlign: TextAlign.center,
          title,
          style: AppTextTheme.kTitleLarge(context, fontWeight: FontWeight.w600),
        ),
        // icon
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: CustomIconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.kWhite,
            ),
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
