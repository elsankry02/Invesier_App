import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant/app_colors.dart';
import '../constant/app_svgs.dart';
import '../extension/extension.dart';

class CustomSocialAuthButton extends StatelessWidget {
  final void Function()? onLoginWithGoogle, onLoginWithApple;
  const CustomSocialAuthButton({
    super.key,
    this.onLoginWithGoogle,
    this.onLoginWithApple,
  });

  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    return Column(
      children: [
        // Or connect with
        Text(
          local.orconnectwith,
          style: context.kTextTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Google
            customSocialIconButton(
              onTap: onLoginWithGoogle,
              assetName: AppSvgs.kGoogle,
            ),
            SizedBox(width: 8),
            // Apple
            customSocialIconButton(
              onTap: onLoginWithApple,
              assetName: AppSvgs.kApple,
            ),
          ],
        ),
      ],
    );
  }

  GestureDetector customSocialIconButton({
    required void Function()? onTap,
    required String assetName,
  }) {
    return GestureDetector(
      // onTapGoogle
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 11, horizontal: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.kWhite,
        ),
        // title
        child: SvgPicture.asset(assetName),
      ),
    );
  }
}
