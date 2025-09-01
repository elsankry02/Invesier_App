import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/components/show_custom_top_snack_bar.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_strings.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/router/router.dart';
import '../../../../provider/get/get_authenticated_user_provider.dart';
import '../../../../provider/post/logout_provider.dart';
import '../../../../provider/provider.dart';
import '../widget/drawer_dialog_logout_widget.dart';
import '../widget/drawer_title_widget.dart';

@RoutePage()
class DrawerPage extends ConsumerStatefulWidget {
  const DrawerPage({super.key});

  @override
  ConsumerState<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends ConsumerState<DrawerPage> {
  @override
  void initState() {
    ref.read(getAuthenticatedUserProvider.notifier).getUser();
    super.initState();
  }

  Future<void> logout() async {
    final notifier = ref.read(logoutProvider.notifier);
    await notifier.logout();
  }

  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    ref.listen(logoutProvider, (_, state) async {
      if (state is LogoutFaliure) {
        showCustomErrorMessage(context, message: state.errMessage);
        log(state.errMessage);
        return;
      }
      if (state is LogoutSuccess) {
        await ref.read(prefsProvider).remove(AppStrings.userToken);
        await context.router.replaceAll([WelcomeRoute()]);
        return showCustomSuccessMessage(context, message: local.logoutsuccess);
      }
    });
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.kOne, AppColors.kTwo],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    final state = ref.watch(getAuthenticatedUserProvider);
                    if (state is GetAuthenticatedUserSuccess) {
                      final user = state.userModel;
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        // leading
                        leading: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            ClipOval(
                              child: Image.network(
                                width: 35,
                                height: 35,
                                fit: BoxFit.cover,
                                user.avatarUrl,
                              ),
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 12,
                                  width: 12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: AppColors.kWhite,
                                  ),
                                ),
                                Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColors.kOceanGreen,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // title
                        title: Text(
                          user.name,
                          style: context.kTextTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.kGray,
                          ),
                        ),
                        // subtitle
                        subtitle: Text(
                          user.username,
                          style: context.kTextTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    }
                    if (state is GetAuthenticatedUserFaliure) {
                      return Text(state.errMessage);
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.kDarkenText,
                      ),
                    );
                  },
                ),
                DrawerTitleWidget(
                  title: local.viewprofile,
                  onTap: () => context.router.push(PersonalProfileRoute()),
                ),
                DrawerTitleWidget(
                  onTap: () => context.router.push(SettingsRoute()),
                  title: local.settings,
                ),
                DrawerTitleWidget(
                  onTap:
                      () => showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder:
                            (context) =>
                                DrawerDialogLogOutWidget(onPressed: logout),
                      ),
                  title: local.logout,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
