import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constant/color_manger.dart';
import '../../../../../core/constant/image_manger.dart';
import '../../../../../core/constant/svg_manger.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/router/router.dart';

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
          SvgPicture.asset(SvgManger.kInvinserLogo),
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
                    SvgManger.kSearch,
                    colorFilter: ColorFilter.mode(
                      ColorManger.kWhite,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                // notifications GestureDetector
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
                              color: ColorManger.kWhite,
                            ),
                          ),
                          Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              color: ColorManger.kRedTwo,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Image GestureDetector
                GestureDetector(
                  // Navigate
                  onTap: () {
                    context.router.push(SideMenuRoute());
                  },
                  child: ClipOval(
                    child: Image.asset(
                      ImageManger.kBoyFour,
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
