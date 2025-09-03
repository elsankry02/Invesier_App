import 'package:flutter/material.dart';

import '../constant/app_colors.dart';
import '../extension/extension.dart';
import 'custom_inkwel_button_widget.dart';

class CustomButtonSheetWidget extends StatelessWidget {
  final String firstTitle, secondTitle;
  final IconData? firstIcon, secondIcon;
  final void Function()? onFirstTap, onSecondTap;

  const CustomButtonSheetWidget({
    super.key,
    required this.firstTitle,
    required this.secondTitle,
    required this.onFirstTap,
    required this.onSecondTap,
    this.firstIcon,
    this.secondIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.kHeavyMetal, AppColors.kBackGround],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.height * 0.016,
          vertical: context.height * 0.024,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // First button
            CustomInkwelButtonWidget(
              title: firstTitle,
              onTap: onFirstTap,
              icon: firstIcon,
            ),
            const Divider(thickness: 2),
            // Second button
            CustomInkwelButtonWidget(
              title: secondTitle,
              onTap: onSecondTap,
              icon: secondIcon,
            ),
          ],
        ),
      ),
    );
  }
}
