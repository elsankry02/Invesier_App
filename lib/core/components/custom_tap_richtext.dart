import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/constant/app_text_theme.dart';

class CustomTapRichText extends StatelessWidget {
  final String textSpanOne, textSpanTwo;
  final void Function() onTap;
  const CustomTapRichText({
    super.key,
    required this.textSpanOne,
    required this.textSpanTwo,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          // textSpan One
          TextSpan(
            text: textSpanOne,
            style: AppTextTheme.kTitleSmall(
              context,
              fontWeight: FontWeight.w600,
            ),
          ),
          // textSpan Two
          TextSpan(
            text: textSpanTwo,
            style: AppTextTheme.kTitleSmall(
              context,
              fontWeight: FontWeight.w600,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
