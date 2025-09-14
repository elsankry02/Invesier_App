import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/constant/app_colors.dart';
import '../../../../../../../core/extension/extension.dart';

class IconLabelTile extends StatelessWidget {
  final String svg, title;
  const IconLabelTile({super.key, required this.svg, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.height * 0.016),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.kHeavyMetal,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        spacing: context.height * 0.010,
        children: [
          SvgPicture.asset(svg),
          Text(
            title,
            style: context.kTextTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
