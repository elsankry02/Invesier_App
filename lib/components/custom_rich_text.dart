import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.textSpanOne,
    required this.textSpanTwo,
    required this.colorSpanOne,
    required this.colorSpanTwo,
    required this.onTap,
  });
  final String textSpanOne;
  final Color colorSpanOne;
  final String textSpanTwo;
  final Color colorSpanTwo;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    final kTextTheme = Theme.of(context).textTheme;
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: textSpanOne,
            style: kTextTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.w500,
              color: colorSpanOne,
            ),
          ),
          TextSpan(
            text: textSpanTwo,
            style: kTextTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.w500,
              color: colorSpanTwo,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
