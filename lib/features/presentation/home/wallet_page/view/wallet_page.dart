import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/custom_appbar_widget.dart';
import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_svgs.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/router/router.dart';
import '../widget/recharge_transaction_tile_widget.dart';
import '../widget/wallet_info_card_widget.dart';

@RoutePage()
class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

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
              top: context.height * 0.020,
              left: context.height * 0.016,
              right: context.height * 0.016,
            ),
            children: [
              CustomAppBarWidget(title: local.wallet),
              SizedBox(height: context.height * 0.022),
              WalletInfoCardWidget(),
              SizedBox(height: context.height * 0.024),
              CustomPrimaryButton(
                title: local.deposit,
                style: context.kTextTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
                backGroundColor: AppColors.kNum,
                padding: EdgeInsets.symmetric(vertical: context.height * 0.010),
                borderRadius: BorderRadius.circular(10),
                onTap: () => context.router.push(TransactionsHistoryRoute()),
              ),
              SizedBox(height: context.height * 0.024),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomPrimaryButton(
                    title: local.recenttransactions,
                    style: context.kTextTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  CustomPrimaryButton(
                    title: local.viewall,
                    style: context.kTextTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                    onTap: () => context.router.push(RecentTransactionsRoute()),
                  ),
                ],
              ),
              SizedBox(height: context.height * 0.013),
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
