import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_svgs.dart';
import '../../../../../core/extension/extension.dart';
import '../../challenges_page/challenges_page.dart';
import '../../home/drawer_page/view/drawer_page.dart';
import '../../home/home_page/view/home_page.dart';
import '../../learn_page/learn_page.dart';
import '../../messages_page/messages_page.dart';
import '../widget/action_button_location_widget.dart';
import '../widget/navigationbar_item_widget.dart';
import '../widget/post_live_bottom_sheet_widget.dart';

@RoutePage()
class MainNavigationPage extends StatefulWidget {
  final Widget? drawer;
  const MainNavigationPage({super.key, this.drawer});
  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;
  List<Widget> pages = [
    HomePage(),
    ChallengesPage(),
    MessagesPage(),
    LearnPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;

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
                  // 1
                  NavigationBarItemWidget(
                    title: local.home,
                    assetName: AppSvgs.kHome,
                    selectedIndex: selectedIndex,
                    index: 0,
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                  ),
                  // 2
                  NavigationBarItemWidget(
                    title: local.challenge,
                    assetName: AppSvgs.kChallenge,
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
                    return PostLiveBottomSheetWidget();
                  },
                );
              },
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 3
                  NavigationBarItemWidget(
                    title: local.learn,
                    assetName: AppSvgs.kLearn,
                    selectedIndex: selectedIndex,
                    index: 2,
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                  ),
                  // 4
                  NavigationBarItemWidget(
                    title: local.messages,
                    assetName: AppSvgs.kMessages,
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
