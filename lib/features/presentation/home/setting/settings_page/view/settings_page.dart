import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/components/custom_appbar_widget.dart';
import '../../../../../../core/components/show_custom_top_snack_bar.dart';
import '../../../../../../core/constant/app_strings.dart';
import '../../../../../../core/constant/app_svgs.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/router/router.dart';
import '../widget/setting_language_dialog.dart';
import '../widget/settings_item_widget.dart';
import '../../../../../provider/delete/delete_account_provider.dart';
import '../../../../../provider/provider.dart';

import '../../../../../../core/constant/app_colors.dart';

@RoutePage()
class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  Future<void> deleteAccount() async {
    final notifier = ref.read(deleteAccountProvider.notifier);
    await notifier.deleteAccount();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(deleteAccountProvider, (_, state) async {
      if (state is DeleteAccountFailure) {
        showCustomErrorMessage(context, message: state.errorMessage);
        return;
      } else if (state is DeleteAccountSuccess) {
        await ref.read(prefsProvider).remove(AppStrings.userToken);
        await context.router.replaceAll([WelcomeRoute()]);
        showCustomSuccessMessage(
          context,
          message: "Account deleted successfully",
        );
      }
    });
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
                subtitle: Text(
                  "Remove ads, enjoy Invesier as you wish",
                  style: context.kTextTheme.labelMedium!.copyWith(
                    color: AppColors.kBoulder,
                  ),
                ),
                onTap: () => context.router.push(VerificationRequestRoute()),
              ),
              SettingsItemWidget(
                leading: SvgPicture.asset(AppSvgs.kRepoIconCarrier),
                title: "Personal details",
                onTap:
                    () =>
                        showCustomErrorMessage(context, message: 'COMING SOON'),
              ),
              SettingsItemWidget(
                leading: Icon(Icons.language),
                title: "App language",
                onTap:
                    () => showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return SettingLanguageDialog();
                      },
                    ),
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
                    () => showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder:
                          (context) => AlertDialog(
                            backgroundColor: AppColors.kBackGround,
                            title: Text("Confirm"),
                            content: Text(
                              "Are you sure you want to delete your account?",
                              style: context.kTextTheme.labelMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => context.router.maybePop(),
                                child: Text(
                                  "Cancel",
                                  style: context.kTextTheme.labelMedium!
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                              ),
                              TextButton(
                                onPressed: () => deleteAccount(),
                                child: Text(
                                  "Delete",
                                  style: context.kTextTheme.labelMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.kRedTwo,
                                      ),
                                ),
                              ),
                            ],
                          ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
