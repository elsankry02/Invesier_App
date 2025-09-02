import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/custom_appbar_widget.dart';
import '../../../../core/components/custom_primary_button.dart';
import '../../../../core/components/show_custom_top_snack_bar.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_svgs.dart';
import '../../../../core/extension/extension.dart';
import '../wallet_page/widget/recharge_transaction_tile_widget.dart';

@RoutePage()
class RecentTransactionsPage extends StatelessWidget {
  const RecentTransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.kOne, AppColors.kTwo],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.only(
              left: context.height * 0.016,
              right: context.height * 0.016,
              top: context.height * 0.020,
            ),
            children: [
              CustomAppBarWidget(title: local.recenttransactions),
              SizedBox(height: context.height * 0.035),
              Text(
                local.filterby,
                style: context.kTextTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: context.height * 0.008),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomPrimaryButton(
                    title: local.price,
                    style: context.kTextTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: context.height * 0.008,
                      horizontal: context.height * 0.043,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.kOceanGreen),
                    onTap:
                        () => showCustomErrorMessage(
                          context,
                          message: local.comingsoon,
                        ),
                  ),
                  CustomPrimaryButton(
                    title: local.date,
                    style: context.kTextTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: context.height * 0.008,
                      horizontal: context.height * 0.043,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.kOceanGreen),
                    onTap:
                        () => showCustomErrorMessage(
                          context,
                          message: local.comingsoon,
                        ),
                  ),
                  CustomPrimaryButton(
                    title: local.invees,
                    style: context.kTextTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: context.height * 0.043,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.kOceanGreen),
                    onTap:
                        () => showCustomErrorMessage(
                          context,
                          message: local.comingsoon,
                        ),
                  ),
                ],
              ),
              SizedBox(height: context.height * 0.016),
              RechargeTransactionTileWidget(
                leading: AppSvgs.kSentBlue,
                title: local.recharge,
                subtitle: "10 - 11 - 2002",
                trailing: "150.000.000",
                color: AppColors.kDodgerBlue,
              ),
              RechargeTransactionTileWidget(
                leading: AppSvgs.kSent,
                title: local.recharge,
                subtitle: "10 - 11 - 2002",
                trailing: "150.000.000",
                color: AppColors.kNum,
              ),

              RechargeTransactionTileWidget(
                leading: AppSvgs.kSentGold,
                title: local.recharge,
                subtitle: "10 - 11 - 2002",
                trailing: "150.000.000",
                color: AppColors.kMySin,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
