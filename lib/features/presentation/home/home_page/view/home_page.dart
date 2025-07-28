import 'package:flutter/material.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/extension/extension.dart';
import '../widget/enum_item.dart';
import '../widget/foryou_widget.dart';
import '../widget/invesier_appbar_widget.dart';
import '../widget/pioneers_widget.dart';

enum EnumView { foryou, pioneers }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  EnumView enumView = EnumView.foryou;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  // AppBar
                  InvesierAppBar(),
                  SizedBox(height: context.height * 0.010),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // For You
                      EnumItem(
                        title: 'For You',
                        titleColor:
                            enumView == EnumView.foryou
                                ? AppColors.kCodGray
                                : AppColors.kWhite,
                        backGroundColor:
                            enumView == EnumView.foryou
                                ? AppColors.kOceanGreen
                                : AppColors.kBackGround,
                        onTap: () {
                          setState(() {
                            enumView = EnumView.foryou;
                          });
                        },
                      ),
                      SizedBox(width: context.width * 0.010),
                      // Pioneers
                      EnumItem(
                        title: 'Pioneers',
                        titleColor:
                            enumView == EnumView.pioneers
                                ? AppColors.kTertiary
                                : AppColors.kWhite,
                        backGroundColor:
                            enumView == EnumView.pioneers
                                ? AppColors.kOceanGreen
                                : AppColors.kBackGround,
                        onTap: () {
                          setState(() {
                            enumView = EnumView.pioneers;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: context.height * 0.010),
                  // enumView
                  enumView == EnumView.foryou
                      ? ForYouWidget()
                      : PioneersWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
