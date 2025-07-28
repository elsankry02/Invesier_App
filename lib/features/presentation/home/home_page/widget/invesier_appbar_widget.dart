import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_images.dart';
import '../../../../../core/constant/app_svgs.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/router/router.dart';
import '../../../bottom_navigationbar_page/view/bottom_navigation_bar_page.dart';

class InvesierAppBar extends StatelessWidget {
  const InvesierAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 20, end: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          SvgPicture.asset(AppSvgs.kInvinserLogo),
          SizedBox(
            width: context.width * 0.250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Search  GestureDetector
                GestureDetector(
                  onTap: () {
                    context.router.push(SearchRoute());
                  },
                  child: SvgPicture.asset(
                    width: 20,
                    height: 20,
                    AppSvgs.kSearch,
                    colorFilter: ColorFilter.mode(
                      AppColors.kWhite,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                // notifications
                GestureDetector(
                  onTap: () {
                    context.router.push(NotificationRoute());
                  },
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Icon(Icons.notifications_none_rounded),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: AppColors.kWhite,
                            ),
                          ),
                          Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              color: AppColors.kRedTwo,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Image
                GestureDetector(
                  onTap: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                  child: ClipOval(
                    child: Image.asset(
                      AppImages.kBoyFour,
                      fit: BoxFit.cover,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
