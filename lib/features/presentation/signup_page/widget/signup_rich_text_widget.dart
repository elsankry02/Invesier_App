import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/constant/app_text_theme.dart';

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
    final local = context.kAppLocalizations;

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: AppTextTheme.kLabelMedium(context, fontWeight: FontWeight.w300),
        children: [
          TextSpan(text: local.bycontinuingyouagreeto),
          // Terms of Use
          TextSpan(
            text: local.termsofuse,
            style: AppTextTheme.kLabelMedium(
              context,
              fontWeight: FontWeight.w500,
            ),
            recognizer: TapGestureRecognizer()..onTap = termsOfUseOnTap,
          ),
          TextSpan(text: local.and),
          // Privacy Policy.
          TextSpan(
            text: local.privacypolicy,
            style: AppTextTheme.kLabelMedium(
              context,
              fontWeight: FontWeight.w500,
            ),
            recognizer: TapGestureRecognizer()..onTap = privacyPolicyOnTap,
          ),
        ],
      ),
    );
  }
}
