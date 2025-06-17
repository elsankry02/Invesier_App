import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/features/presentation/challenges_page/view/challenges_page.dart';
import 'package:invesier/features/presentation/home_page/view/home_page.dart';
import 'package:invesier/features/presentation/learn_page/view/learn_page.dart';
import 'package:invesier/features/presentation/navbar_page/widget/action_button_location_widget.dart';
import 'package:invesier/features/presentation/navbar_page/widget/bottom_appbar_item_widget.dart';
import 'package:invesier/features/presentation/trade_page/view/trade_page.dart';

@RoutePage()
class NavbarPage extends StatefulWidget {
  const NavbarPage({super.key});

  @override
  State<NavbarPage> createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
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
      backgroundColor: ColorManger.kBackGround,
      body: pages.elementAt(selectedIndex),

      bottomNavigationBar: BottomAppBar(
        color: ColorManger.kBackGround,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //! home
            BottomAppBarItemWidget(
              title: 'Home',
              assetName: 'assets/svg/home.svg',
              selectedIndex: selectedIndex,
              index: 0,
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
              },
            ),
            //! challenges
            BottomAppBarItemWidget(
              title: 'Challenges',
              assetName: 'assets/svg/challenges.svg',
              selectedIndex: selectedIndex,
              index: 1,
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
            ),
            //! ActionButton Location Widget
            ActionButtonLocationWidget(onPressed: () {}),
            //! Trade
            BottomAppBarItemWidget(
              title: 'Trade',
              assetName: 'assets/svg/trade.svg',
              selectedIndex: selectedIndex,
              index: 2,
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
              },
            ),
            //! Learn
            BottomAppBarItemWidget(
              title: 'Learn',
              assetName: 'assets/svg/frame.svg',
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
    );
  }
}
