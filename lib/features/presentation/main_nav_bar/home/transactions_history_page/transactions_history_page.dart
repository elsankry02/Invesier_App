import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/constant/app_text_theme.dart';

import '../../../../../core/components/custom_appbar_widget.dart';
import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_svgs.dart';
import '../../../../../core/extension/extension.dart';
import '../wallet_page/widget/recharge_transaction_tile_widget.dart';

@RoutePage()
class TransactionsHistoryPage extends StatelessWidget {
  const TransactionsHistoryPage({super.key});

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
              CustomAppBarWidget(
                title: local.transactionshistory,
                onPressed: () => context.router.maybePop(),
              ),
              SizedBox(height: context.height * 0.035),
              Text(
                local.filterby,
                style: AppTextTheme.kLabelLarge(
                  context,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: context.height * 0.008),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomPrimaryButton(
                    title: local.type,
                    style: AppTextTheme.kLabelLarge(
                      context,
                      fontWeight: FontWeight.w500,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: context.height * 0.066,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.kOceanGreen),
                    onTap: () {},
                  ),
                  CustomPrimaryButton(
                    title: local.date,
                    style: AppTextTheme.kLabelLarge(
                      context,
                      fontWeight: FontWeight.w500,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: context.height * 0.066,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.kOceanGreen),
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: context.height * 0.016),
              RechargeTransactionTileWidget(
                leading: AppSvgs.kSent,
                title: local.recharge,
                subtitle: "10 - 11 - 2002",
                trailing: "150.000.000",
                color: AppColors.kNum,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
