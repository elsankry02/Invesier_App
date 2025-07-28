import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_svgs.dart';
import '../../challenges_page/view/challenges_page.dart';
import '../../home/drawer_page/view/drawer_page.dart';
import '../../home/home_page/view/home_page.dart';
import '../../learn_page/view/learn_page.dart';
import '../../trade_page/view/trade_page.dart';
import '../widget/action_button_location_widget.dart';
import '../widget/navigationbar_item_widget.dart';
import '../widget/show_model_button_sheet_widget.dart';

@RoutePage()
class BottomNavigationBarPage extends StatefulWidget {
  final Widget? drawer;
  const BottomNavigationBarPage({super.key, this.drawer});
  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

final scaffoldKey = GlobalKey<ScaffoldState>();

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  int selectedIndex = 0;
  List<Widget> pages = [HomePage(), ChallengesPage(), TradePage(), LearnPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerPage(),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.kOne, AppColors.kTwo],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: pages.elementAt(selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: AppColors.kBackGround),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // home
                  NavigationBarItemWidget(
                    title: 'Home',
                    assetName: AppSvgs.kHome,
                    selectedIndex: selectedIndex,
                    index: 0,
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                  ),
                  // challenges
                  NavigationBarItemWidget(
                    title: 'Challenges',
                    assetName: AppSvgs.kChallenges,
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
                  // Trade
                  NavigationBarItemWidget(
                    title: 'Trade',
                    assetName: AppSvgs.kTrade,
                    selectedIndex: selectedIndex,
                    index: 2,
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                  ),
                  // Learn
                  NavigationBarItemWidget(
                    title: 'Learn',
                    assetName: AppSvgs.kLearn,
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
