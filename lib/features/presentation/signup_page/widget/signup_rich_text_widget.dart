import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/extension/extension.dart';

class SignUpRichTextWidget extends StatelessWidget {
  const SignUpRichTextWidget({
    super.key,

    this.termsOfUseOnTap,
    this.privacyPolicyOnTap,
  });
  final Function()? termsOfUseOnTap, privacyPolicyOnTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: context.kTextTheme.labelMedium!.copyWith(
          fontWeight: FontWeight.w300,
        ),
        children: [
          TextSpan(text: 'By continuing, you agree to \n'),
          // Terms of Use
          TextSpan(
            text: 'Terms of Use',
            style: context.kTextTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w500,
            ),
            recognizer: TapGestureRecognizer()..onTap = termsOfUseOnTap,
          ),
          TextSpan(text: ' and '),
          // Privacy Policy.
          TextSpan(
            text: 'Privacy Policy.',
            style: context.kTextTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w500,
            ),
            recognizer: TapGestureRecognizer()..onTap = privacyPolicyOnTap,
          ),
        ],
      ),
    );
  }
}
