import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpRichTextWidget extends StatelessWidget {
  const SignUpRichTextWidget({
    super.key,
    required this.kTextTheme,
    this.termsOfUseOnTap,
    this.privacyPolicyOnTap,
  });
  final Function()? termsOfUseOnTap;
  final Function()? privacyPolicyOnTap;
  final TextTheme kTextTheme;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: kTextTheme.labelMedium!.copyWith(fontWeight: FontWeight.w300),
        children: [
          TextSpan(text: 'By continuing, you agree to \n'),
          //! Terms of Use
          TextSpan(
            text: 'Terms of Use',
            style: kTextTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w500,
            ),
            recognizer: TapGestureRecognizer()..onTap = termsOfUseOnTap,
          ),
          TextSpan(text: ' and '),
          //! Privacy Policy.
          TextSpan(
            text: 'Privacy Policy.',
            style: kTextTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w500,
            ),
            recognizer: TapGestureRecognizer()..onTap = privacyPolicyOnTap,
          ),
        ],
      ),
    );
  }
}
