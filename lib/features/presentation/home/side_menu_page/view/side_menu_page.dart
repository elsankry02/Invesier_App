import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../core/constant/color_manger.dart';
import '../../../../../core/constant/image_manger.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/router/router.dart';
import '../widget/side_menu_title_widget.dart';

@RoutePage()
class SideMenuPage extends StatelessWidget {
  const SideMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorManger.k1, ColorManger.k2],
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
                          ImageManger.kBoyFour,
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
                              color: ColorManger.kWhite,
                            ),
                          ),
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ColorManger.kOceanGreen,
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
                      color: ColorManger.kGray,
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
                SideMenuTitleWidget(
                  title: 'View profile',
                  onTap: () {
                    context.router.push(PersonalProfileRoute());
                  },
                ),
                // Side Menu Title Widget (Settings)
                SideMenuTitleWidget(
                  onTap: () {
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.info(
                        backgroundColor: ColorManger.kBoulder,
                        message: "COMING SOON",
                      ),
                    );
                  },
                  title: 'Settings',
                ),
                // Side Menu Title Widget (Log out)
                SideMenuTitleWidget(
                  onTap: () {
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.info(
                        backgroundColor: ColorManger.kBoulder,
                        message: "COMING SOON",
                      ),
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
