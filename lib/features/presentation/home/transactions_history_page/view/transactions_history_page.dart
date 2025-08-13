import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/components/custom_primary_button.dart';
import 'package:invesier/core/constant/app_colors.dart';
import 'package:invesier/core/constant/app_svgs.dart';
import 'package:invesier/core/extension/extension.dart';
import 'package:invesier/features/presentation/home/transactions_history_page/widget/transactions_history_appbar_widget.dart';
import 'package:invesier/features/presentation/home/wallet_page/widget/recharge_transaction_tile_widget.dart';

@RoutePage()
class TransactionsHistoryPage extends StatelessWidget {
  const TransactionsHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsets.only(left: 16, right: 16, top: 20),
            children: [
              TransactionsHistoryAppBarWidget(),
              SizedBox(height: context.height * 0.035),
              Text(
                "Filter by",
                style: context.kTextTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: context.height * 0.008),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomPrimaryButton(
                    title: "Type",
                    style: context.kTextTheme.labelLarge!.copyWith(
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
                    title: "Date",
                    style: context.kTextTheme.labelLarge!.copyWith(
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
                title: "Recharge",
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
