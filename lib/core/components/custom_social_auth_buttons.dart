import 'package:flutter/material.dart';
import 'package:invesier/core/components/custom_social_button.dart';
import 'package:invesier/core/constant/svg_manger.dart';

class CustomSocialAuthButtons extends StatelessWidget {
  const CustomSocialAuthButtons({super.key, this.onTapGoogle, this.onTapApple});

  final void Function()? onTapGoogle;
  final void Function()? onTapApple;
  @override
  Widget build(BuildContext context) {
    final kTextTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        //! Or connect with
        Text(
          'Or connect with',
          style: kTextTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600),
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
