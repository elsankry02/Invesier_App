import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/components/show_custom_top_snack_bar.dart';
import 'package:invesier/core/constant/app_strings.dart';
import 'package:invesier/features/provider/get/get_authenticated_user_provider.dart';
import 'package:invesier/features/provider/provider.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/router/router.dart';
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

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    final state = ref.watch(getAuthenticatedUserProvider);
                    if (state is GetAuthenticatedUserSuccess) {
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
                                state.userModel.avatarUrl,
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
                          state.userModel.name,
                          style: context.kTextTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.kGray,
                          ),
                        ),
                        // subtitle
                        subtitle: Text(
                          state.userModel.username,
                          style: context.kTextTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    }
                    if (state is GetAuthenticatedUserFaliure) {
                      return Text(state.errMessage);
                    }
                    return SizedBox();
                  },
                ),
                // Side Menu Title Widget (View profile)
                DrawerTitleWidget(
                  title: 'View profile',
                  onTap: () {
                    context.router.push(PersonalProfileRoute());
                  },
                ),
                // Side Menu Title Widget (Settings)
                DrawerTitleWidget(
                  onTap: () {
                    showCustomErrorMessage(context, message: "COMING SOON");
                  },
                  title: 'Settings',
                ),
                // Side Menu Title Widget (Log out)
                Consumer(
                  builder: (context, ref, child) {
                    return DrawerTitleWidget(
                      onTap: () async {
                        await ref.read(prefsProvider).clear();
                        final token = ref
                            .read(prefsProvider)
                            .getString(AppStrings.userToken);
                        log("Token : $token");
                        context.router.replaceAll([WelcomeRoute()]);
                        showCustomSuccessMessage(
                          context,
                          message: "Logged out successfully",
                        );
                      },
                      title: "Log out",
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
