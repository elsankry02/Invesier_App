import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invesier/core/constant/app_text_theme.dart';

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
          style: AppTextTheme.kLabelLarge(context, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: context.height * 0.015),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Google
            customSocialIconButton(
              onTap: onLoginWithGoogle,
              assetName: AppSvgs.kGoogle,
            ),
            SizedBox(width: context.height * 0.008),
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
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 11, horizontal: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.kWhite,
        ),
        child: SvgPicture.asset(assetName),
      ),
    );
  }
}
