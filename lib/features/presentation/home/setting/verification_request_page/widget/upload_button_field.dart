import 'package:flutter/material.dart';
import '../../../../../../core/components/custom_primary_button.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/extension/extension.dart';

class UploadButtonField extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const UploadButtonField({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomPrimaryButton(
      title: title,
      margin: EdgeInsets.only(bottom: 16),
      style: context.kTextTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w600,
      ),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: AppColors.kBorder),
      backGroundColor: AppColors.kDivider,
      padding: EdgeInsets.symmetric(
        horizontal: context.height * 0.105,
        vertical: context.height * 0.013,
      ),
      onTap: onTap,
    );
  }
}
