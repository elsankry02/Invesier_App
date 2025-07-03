import 'package:flutter/material.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/extension/extension.dart';

class HomeFollowRichTextWidget extends StatelessWidget {
  const HomeFollowRichTextWidget({
    super.key,
    required this.number,
    required this.title,
    this.onTap,
  });
  final String number, title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: number,
              style: context.kTextTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),

            TextSpan(
              text: title,
              style: context.kTextTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w400,
                color: ColorManger.kGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
