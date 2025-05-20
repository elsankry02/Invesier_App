import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.textSpanOne,
    required this.textSpanTwo,
    required this.onTap,
  });
  final String textSpanOne;
  final String textSpanTwo;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    final kTextTheme = Theme.of(context).textTheme;
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: textSpanOne,
            style: kTextTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),
          ),
          TextSpan(
            text: textSpanTwo,
            style: kTextTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
