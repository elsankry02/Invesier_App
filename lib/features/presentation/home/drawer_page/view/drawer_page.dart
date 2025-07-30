import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/constant/app_strings.dart';
import 'package:invesier/features/provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_images.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/router/router.dart';
import '../widget/drawer_title_widget.dart';

@RoutePage()
class DrawerPage extends ConsumerWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
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
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  // leading
                  leading: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          width: 35,
                          height: 35,
                          fit: BoxFit.cover,
                          AppImages.kBoyFour,
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
                    'Olivia Rhye',
                    style: context.kTextTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.kGray,
                    ),
                  ),
                  // subtitle
                  subtitle: Text(
                    'olivia@untitledui.com',
                    style: context.kTextTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
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
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.info(
                        backgroundColor: AppColors.kBoulder,
                        message: "COMING SOON",
                      ),
                    );
                  },
                  title: 'Settings',
                ),
                // Side Menu Title Widget (Log out)
                DrawerTitleWidget(
                  onTap: () {
                    ref.read(prefsProvider).remove(AppStrings.userToken);
                    context.router.replaceAll([WelcomeRoute()]);
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.success(message: "Logged out successfully"),
                    );
                  },
                  title: 'Log out',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
