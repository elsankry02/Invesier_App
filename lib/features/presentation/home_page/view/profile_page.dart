import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/constant/image_manger.dart';
import 'package:invesier/core/extension/extension.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
                  leading: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          width: 35,
                          height: 35,
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
                  title: Text(
                    'Olivia Rhye',
                    style: context.kTextTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: ColorManger.kGray,
                    ),
                  ),
                  subtitle: Text(
                    'olivia@untitledui.com',
                    style: context.kTextTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                profileText(context, onTap: () {}, title: 'View profile'),
                profileText(context, onTap: () {}, title: 'Settings'),
                profileText(context, onTap: () {}, title: 'Log out'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell profileText(
    BuildContext context, {
    required String title,
    Function()? onTap,
  }) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text(
          title,
          style: context.kTextTheme.labelMedium!.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
