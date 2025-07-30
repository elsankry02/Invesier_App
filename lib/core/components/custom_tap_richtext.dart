import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../extension/extension.dart';

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
            style: context.kTextTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          // textSpan Two
          TextSpan(
            text: textSpanTwo,
            style: context.kTextTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.w600,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
