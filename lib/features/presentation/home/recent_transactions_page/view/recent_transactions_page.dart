import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../../core/components/custom_appbar_widget.dart';
import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_svgs.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/router/router.dart';
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
              CustomAppBarWidget(title: "Recent transactions"),
              SizedBox(height: context.height * 0.035),
              Text(
                "Filter by",
                style: context.kTextTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: context.height * 0.008),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomPrimaryButton(
                    title: "Price",
                    style: context.kTextTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: context.height * 0.043,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.kOceanGreen),
                    onTap: () => context.router.push(RechargeRoute()),
                  ),
                  CustomPrimaryButton(
                    title: "Date",
                    style: context.kTextTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: context.height * 0.043,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.kOceanGreen),
                    onTap: () {},
                  ),
                  CustomPrimaryButton(
                    title: "Invees",
                    style: context.kTextTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: context.height * 0.043,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.kOceanGreen),
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(height: context.height * 0.016),
              RechargeTransactionTileWidget(
                leading: AppSvgs.kSentBlue,
                title: "Recharge",
                subtitle: "10 - 11 - 2002",
                trailing: "150.000.000",
                color: AppColors.kDodgerBlue,
              ),
              RechargeTransactionTileWidget(
                leading: AppSvgs.kSent,
                title: "Recharge",
                subtitle: "10 - 11 - 2002",
                trailing: "150.000.000",
                color: AppColors.kNum,
              ),

              RechargeTransactionTileWidget(
                leading: AppSvgs.kSentGold,
                title: "Recharge",
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
