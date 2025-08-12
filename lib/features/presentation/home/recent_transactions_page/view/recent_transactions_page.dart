import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/extension/extension.dart';
import '../widget/transactions_history_appbar_widget.dart';
import '../../wallet_page/widget/recharge_transaction_tile_widget.dart';

@RoutePage()
class RecentTransactionsPage extends StatelessWidget {
  const RecentTransactionsPage({super.key});

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
              Text("Filter by"),
              SizedBox(height: context.height * 0.008),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomPrimaryButton(
                    title: "Type",
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: context.height * 0.080,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.kOceanGreen),
                    onTap: () {},
                  ),
                  CustomPrimaryButton(
                    title: "Date",
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: context.height * 0.080,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.kOceanGreen),
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: context.height * 0.016),
              RechargeTransactionTileWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
