import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../extension/extension.dart';

class CustomRichText extends StatelessWidget {
  final String textSpanOne, textSpanTwo;
  final void Function() onTap;
  const CustomRichText({
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
          // textSpanOne
          TextSpan(
            text: textSpanOne,
            style: context.kTextTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          // textSpanTwo
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
