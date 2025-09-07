import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_images.dart';
import '../../../../../core/constant/app_svgs.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/router/router.dart';
import '../../../../data/provider/get/get_authenticated_user_provider.dart';
import '../../../main_navigation_page/view/main_navigation_page.dart';

class InvesierAppBar extends StatelessWidget {
  const InvesierAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: context.height * 0.020,
        right: context.height * 0.015,
      ),
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
                    width: context.height * 0.020,
                    height: context.height * 0.020,
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
                            height: context.height * 0.010,
                            width: context.height * 0.010,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: AppColors.kWhite,
                            ),
                          ),
                          Container(
                            height: context.height * 0.008,
                            width: context.height * 0.008,
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
                Consumer(
                  builder: (context, ref, child) {
                    final state = ref.watch(getAuthenticatedUserProvider);
                    return GestureDetector(
                      onTap: () {
                        scaffoldKey.currentState!.openDrawer();
                      },
                      child:
                          state is GetAuthenticatedUserSuccess
                              ? ClipOval(
                                child: Image.network(
                                  state.userModel.avatarUrl,
                                  fit: BoxFit.cover,
                                  width: context.height * 0.030,
                                  height: context.height * 0.030,
                                ),
                              )
                              : ClipOval(
                                child: Image.asset(
                                  AppImages.kBoyFour,
                                  fit: BoxFit.cover,
                                  width: context.height * 0.030,
                                  height: context.height * 0.030,
                                ),
                              ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
