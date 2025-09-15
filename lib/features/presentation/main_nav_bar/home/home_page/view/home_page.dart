import 'package:flutter/material.dart';
import 'package:invesier/features/presentation/main_nav_bar/home/pioneers_page/pioneers_page.dart';

import '../../../../../../core/components/custom_primary_button.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/constant/app_enums.dart';
import '../../../../../../core/extension/extension.dart';
import '../../foryou_page/view/foryou_page.dart';
import '../widget/invesier_appbar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  EnumView enumView = EnumView.foryou;

  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: context.height * 0.015),
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
                        title: local.foryou,
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
                          horizontal: context.height * 0.026,
                          vertical: context.height * 0.008,
                        ),
                        borderRadius: BorderRadius.circular(18),
                        onTap: () {
                          setState(() {
                            enumView = EnumView.foryou;
                          });
                        },
                      ),
                      SizedBox(width: context.width * 0.025),
                      // Pioneers
                      CustomPrimaryButton(
                        title: local.pioneers,
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
                          horizontal: context.height * 0.026,
                          vertical: context.height * 0.008,
                        ),
                        borderRadius: BorderRadius.circular(18),
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
                  enumView == EnumView.foryou ? ForYouPage() : PioneersPage(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
