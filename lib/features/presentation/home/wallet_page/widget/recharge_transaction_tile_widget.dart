import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/extension/extension.dart';

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
      margin: EdgeInsets.only(bottom: 13),
      decoration: BoxDecoration(
        color: AppColors.kOne,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: SvgPicture.asset(leading),
        title: Text(
          title,
          style: context.kTextTheme.labelMedium!.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: context.kTextTheme.labelSmall!.copyWith(
            color: AppColors.kBoulder,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Text(
          trailing,
          style: context.kTextTheme.labelMedium!.copyWith(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
