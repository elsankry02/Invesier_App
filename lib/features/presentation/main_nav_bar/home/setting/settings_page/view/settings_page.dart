import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:invesier/core/constant/app_text_theme.dart';

import '../../../../../../../core/components/custom_appbar_widget.dart';
import '../../../../../../../core/constant/app_colors.dart';
import '../../../../../../../core/constant/app_strings.dart';
import '../../../../../../../core/constant/app_svgs.dart';
import '../../../../../../../core/extension/extension.dart';
import '../../../../../../../core/func/show_top_snack_bar.dart';
import '../../../../../../../core/router/router.dart';
import '../../../../../../data/providers/delete/delete_account_provider.dart';
import '../../../../../../data/providers/provider.dart';
import '../widget/setting_change_language.dart';
import '../widget/settings_item_widget.dart';

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
    final local = context.kAppLocalizations;
    ref.listen(deleteAccountProvider, (_, state) async {
      if (state is DeleteAccountFailure) {
        ErrorMessage(context, message: state.errorMessage);
        return;
      }
      if (state is DeleteAccountSuccess) {
        await ref.read(prefsProvider).remove(AppStrings.userToken);
        Phoenix.rebirth(context);
        await context.router.replaceAll([WelcomeRoute()]);
        SuccessMessage(context, message: local.accountdeletedsuccessfully);
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
              CustomAppBarWidget(
                title: local.settings,
                onPressed: () => context.router.maybePop(),
              ),
              SizedBox(height: context.height * 0.035),
              SettingsItemWidget(
                leading: SvgPicture.asset(AppSvgs.kShieldChecklist),
                title: local.verificationrequest,
                subtitle: Text(
                  local.removeadsenjoyinvesierasyouwish,
                  style: AppTextTheme.kLabelMedium(
                    context,
                    color: AppColors.kBoulder,
                  ),
                ),
                onTap: () => context.router.push(VerificationRequestRoute()),
              ),
              SettingsItemWidget(
                leading: SvgPicture.asset(AppSvgs.kRepoIconCarrier),
                title: local.personaldetails,
                onTap: () => ErrorMessage(context, message: local.comingsoon),
              ),
              SettingsItemWidget(
                leading: Icon(Icons.language, color: AppColors.kWhite),
                title: local.applanguage,
                onTap:
                    () => showModalBottomSheet(
                      backgroundColor: AppColors.kHeavyMetal,
                      context: context,
                      builder: (context) {
                        return SettingChangeLanguage();
                      },
                    ),
              ),
              SettingsItemWidget(
                leading: SvgPicture.asset(
                  AppSvgs.kblockVictor,
                  width: context.height * 0.024,
                  height: context.height * 0.024,
                ),
                title: local.blockerslist,
                onTap: () => ErrorMessage(context, message: local.comingsoon),
              ),
              SettingsItemWidget(
                leading: SvgPicture.asset(
                  AppSvgs.kDelete,
                  width: context.height * 0.024,
                  height: context.height * 0.024,
                ),
                title: local.deleteaccount,
                color: AppColors.kRedThree,
                onTap:
                    () => showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder:
                          (context) => AlertDialog(
                            backgroundColor: AppColors.kHeavyMetal,
                            title: Text(local.confirm),
                            content: Text(
                              local.areyousureyouwanttodeleteyouraccount,
                              style: AppTextTheme.kLabelMedium(
                                context,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => context.router.maybePop(),
                                child: Text(
                                  local.cancel,
                                  style: AppTextTheme.kLabelLarge(
                                    context,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () => deleteAccount(),
                                child: Text(
                                  local.delete,
                                  style: AppTextTheme.kLabelLarge(
                                    context,
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
