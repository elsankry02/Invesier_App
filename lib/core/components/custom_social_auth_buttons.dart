import 'package:flutter/material.dart';
import '../extension/extension.dart';

import '../constant/svg_manger.dart';
import 'custom_social_button.dart';

class CustomSocialAuthButtons extends StatelessWidget {
  const CustomSocialAuthButtons({super.key, this.onTapGoogle, this.onTapApple});

  final void Function()? onTapGoogle;
  final void Function()? onTapApple;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //! Or connect with
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
            //! Google
            CustomSocialButton(
              onTapGoogle: onTapGoogle,
              assetName: SvgManger.kGoogle,
            ),
            SizedBox(width: 8),
            //! Apple
            CustomSocialButton(
              onTapGoogle: onTapApple,
              assetName: SvgManger.kApple,
            ),
          ],
        ),
      ],
    );
  }
}
