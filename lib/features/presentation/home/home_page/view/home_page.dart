import 'package:flutter/material.dart';
import 'package:invesier/core/components/custom_primary_button.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/extension/extension.dart';
import '../../foryou_page/view/foryou_widget.dart';
import '../../pioneers_page/view/pioneers_widget.dart';
import '../widget/invesier_appbar_widget.dart';

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
                      CustomPrimaryButton(
                        title: 'For You',
                        style: context.kTextTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w900,
                          color:
                              enumView == EnumView.foryou
                                  ? AppColors.kCodGray
                                  : AppColors.kWhite,
                        ),
                        backGroundColor:
                            enumView == EnumView.foryou
                                ? AppColors.kOceanGreen
                                : AppColors.kBackGround,
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 26,
                          vertical: 8,
                        ),
                        radius: 18,
                        onTap: () {
                          setState(() {
                            enumView = EnumView.foryou;
                          });
                        },
                      ),
                      SizedBox(width: context.width * 0.025),
                      // Pioneers
                      CustomPrimaryButton(
                        title: 'Pioneers',
                        style: context.kTextTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w900,
                          color:
                              enumView == EnumView.pioneers
                                  ? AppColors.kTertiary
                                  : AppColors.kWhite,
                        ),
                        backGroundColor:
                            enumView == EnumView.pioneers
                                ? AppColors.kOceanGreen
                                : AppColors.kBackGround,
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 26,
                          vertical: 8,
                        ),
                        radius: 18,
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
