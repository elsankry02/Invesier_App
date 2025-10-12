import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/components/custom_appbar_widget.dart';
import '../../../../../../../core/components/custom_primary_button.dart';
import '../../../../../../../core/constant/app_colors.dart';
import '../../../../../../../core/extension/extension.dart';

class VerificationSuccessWidget extends StatelessWidget {
  final String title, subTitle, imageOne, imageTwo;
  final void Function()? onTap;
  const VerificationSuccessWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imageOne,
    required this.imageTwo,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    return Column(
      children: [
        CustomAppBarWidget(
          title: local.verificationrequest,
          onPressed: () => context.router.maybePop(),
        ),
        SizedBox(height: context.height * 0.035),
        Image.asset(imageOne),
        SizedBox(height: context.height * 0.043),
        Image.asset(
          imageTwo,
          height: context.height * 0.100,
          width: context.height * 0.100,
        ),
        SizedBox(height: context.height * 0.034),
        Text(
          textAlign: TextAlign.center,
          title,
          style: context.kTextTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: context.height * 0.018),
        CustomPrimaryButton(
          padding: EdgeInsets.all(16),
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [AppColors.kOne, AppColors.kTwo],
            begin: AlignmentGeometry.topRight,
            end: AlignmentGeometry.bottomLeft,
          ),
          title: subTitle,
          style: context.kTextTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w600,
          ),
          onTap: onTap,
        ),
      ],
    );
  }
}
