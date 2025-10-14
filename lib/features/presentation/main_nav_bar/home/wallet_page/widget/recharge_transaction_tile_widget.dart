import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invesier/core/constant/app_text_theme.dart';

import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/extension/extension.dart';

class RechargeTransactionTileWidget extends StatelessWidget {
  final String leading, title, subtitle, trailing;
  final Color? color;
  const RechargeTransactionTileWidget({
    super.key,
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.trailing,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.height * 0.013),
      decoration: BoxDecoration(
        color: AppColors.kOne,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: SvgPicture.asset(leading),
        title: Text(
          title,
          style: AppTextTheme.kLabelMedium(
            context,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextTheme.kLabelSmall(
            context,
            color: AppColors.kBoulder,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Text(
          trailing,
          style: AppTextTheme.kLabelMedium(
            context,
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
