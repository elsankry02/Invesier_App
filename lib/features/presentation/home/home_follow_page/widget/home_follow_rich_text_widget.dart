import 'package:flutter/material.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/extension/extension.dart';

class HomeFollowRichTextWidget extends StatelessWidget {
  final String title;
  final int number;
  final Function()? onTap;
  const HomeFollowRichTextWidget({
    required this.number,
    required this.title,
    this.onTap,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          children: [
            // number
            TextSpan(
              text: "$number",
              style: context.kTextTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            // title
            TextSpan(
              text: title,
              style: context.kTextTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.kGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
