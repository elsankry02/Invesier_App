import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/extension/extension.dart';

class RechargeTransactionTileWidget extends StatelessWidget {
  const RechargeTransactionTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 13),
      decoration: BoxDecoration(
        color: AppColors.kOne,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: SvgPicture.asset("assets/svg/sent.svg"),
        title: Text(
          "Recharge",
          style: context.kTextTheme.labelMedium!.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          "10 - 11 - 2002",
          style: context.kTextTheme.labelSmall!.copyWith(
            color: AppColors.kBoulder,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Text(
          "150,000,000",
          style: context.kTextTheme.labelMedium!.copyWith(
            color: AppColors.kNum,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
