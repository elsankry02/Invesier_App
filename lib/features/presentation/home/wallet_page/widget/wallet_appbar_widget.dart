import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../../core/components/custom_appbar_title.dart';
import '../../../../../core/components/custom_icon_button.dart';
import '../../../../../core/constant/app_colors.dart';

class WalletAppBarWidget extends StatelessWidget {
  const WalletAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomAppBarTitle(title: "Wallet"),
        Align(
          alignment: Alignment.centerLeft,
          child: CustomIconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.kWhite,
            ),
            onPressed: () => context.router.maybePop(),
          ),
        ),
      ],
    );
  }
}
