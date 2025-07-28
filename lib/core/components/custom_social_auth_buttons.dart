import 'package:flutter/material.dart';

import '../constant/app_svgs.dart';
import '../extension/extension.dart';
import 'custom_social_button.dart';

class CustomSocialAuthButtons extends StatelessWidget {
  final void Function()? onTapGoogle, onTapApple;
  const CustomSocialAuthButtons({super.key, this.onTapGoogle, this.onTapApple});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Or connect with
        Text(
          'Or connect with',
          style: context.kTextTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Google
            CustomSocialButton(onTap: onTapGoogle, title: AppSvgs.kGoogle),
            SizedBox(width: 8),
            // Apple
            CustomSocialButton(onTap: onTapApple, title: AppSvgs.kApple),
          ],
        ),
      ],
    );
  }
}
