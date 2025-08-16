import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invesier/core/components/custom_appbar_widget.dart';
import 'package:invesier/core/components/show_custom_top_snack_bar.dart';
import 'package:invesier/core/constant/app_svgs.dart';
import 'package:invesier/core/extension/extension.dart';
import 'package:invesier/features/presentation/home/settings_page/widget/settings_item_widget.dart';

import '../../../../../core/constant/app_colors.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
            padding: EdgeInsets.all(20),
            children: [
              CustomAppBarWidget(title: "Settings"),
              SizedBox(height: context.height * 0.035),
              SettingsItemWidget(
                leading: SvgPicture.asset(AppSvgs.kShieldChecklist),
                title: "verification request",
                subtitle: Text("Remove ads, enjoy Invesier as you wish"),
              ),
              SettingsItemWidget(
                leading: SvgPicture.asset(AppSvgs.kRepoIconCarrier),
                title: "Personal details",
                onTap:
                    () =>
                        showCustomErrorMessage(context, message: 'COMING SOON'),
              ),
              SettingsItemWidget(
                leading: SvgPicture.asset(
                  AppSvgs.kblockVictor,
                  width: 24,
                  height: 24,
                ),
                title: "Blockers list",
                onTap:
                    () =>
                        showCustomErrorMessage(context, message: 'COMING SOON'),
              ),
              SettingsItemWidget(
                leading: SvgPicture.asset(
                  AppSvgs.kDelete,
                  width: 24,
                  height: 24,
                ),
                title: "Delete account",
                color: AppColors.kRedThree,
                onTap:
                    () =>
                        showCustomErrorMessage(context, message: 'COMING SOON'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
