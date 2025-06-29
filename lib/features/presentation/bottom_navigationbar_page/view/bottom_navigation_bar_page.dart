import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/constant/svg_manger.dart';
import 'package:invesier/features/presentation/bottom_navigationbar_page/widget/action_button_location_widget.dart';
import 'package:invesier/features/presentation/bottom_navigationbar_page/widget/navigationbar_item_widget.dart';
import 'package:invesier/features/presentation/bottom_navigationbar_page/widget/show_model_button_sheet_widget.dart';
import 'package:invesier/features/presentation/challenges_page/view/challenges_page.dart';
import 'package:invesier/features/presentation/home_page/view/home_page.dart';
import 'package:invesier/features/presentation/learn_page/view/learn_page.dart';
import 'package:invesier/features/presentation/trade_page/view/trade_page.dart';

@RoutePage()
class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({super.key});

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int selectedIndex = 0;
  final List<Widget> pages = [
    HomePage(),
    ChallengesPage(),
    TradePage(),
    LearnPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorManger.k1, ColorManger.k2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: pages.elementAt(selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: ColorManger.kBackGround),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //! home
                  NavigationBarItemWidget(
                    title: 'Home',
                    assetName: SvgManger.kHome,
                    selectedIndex: selectedIndex,
                    index: 0,
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                  ),
                  //! challenges
                  NavigationBarItemWidget(
                    title: 'Challenges',
                    assetName: SvgManger.kChallenges,
                    selectedIndex: selectedIndex,
                    index: 1,
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                  ),
                ],
              ),
            ),
            ActionButtonLocationWidget(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ShowModelButtonSheetWidget();
                  },
                );
              },
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //! Trade
                  NavigationBarItemWidget(
                    title: 'Trade',
                    assetName: SvgManger.kTrade,
                    selectedIndex: selectedIndex,
                    index: 2,
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                  ),
                  //! Learn
                  NavigationBarItemWidget(
                    title: 'Learn',
                    assetName: SvgManger.kLearn,
                    selectedIndex: selectedIndex,
                    index: 3,
                    onTap: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
