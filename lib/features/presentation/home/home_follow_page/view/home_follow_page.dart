import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constant/color_manger.dart';
import '../../../../../core/extension/extension.dart';
import '../../home_page/widget/divider_widget.dart';
import '../widget/fans_widget.dart';
import '../widget/home_follow_appbar.dart';
import '../widget/home_follow_rich_text_widget.dart';
import '../widget/home_follow_textformfield_widget.dart';
import '../widget/pioneers_widget.dart';

enum HomeFollowEnum { fans, pioneers }

@RoutePage()
class HomeFollowPage extends StatefulWidget {
  final HomeFollowEnum initialTab;
  const HomeFollowPage({super.key, required this.initialTab});
  @override
  State<HomeFollowPage> createState() => _HomeFollowPageState();
}

class _HomeFollowPageState extends State<HomeFollowPage> {
  HomeFollowEnum homeFollowEnum = HomeFollowEnum.fans;
  final searchController = TextEditingController();

  @override
  void initState() {
    homeFollowEnum = widget.initialTab;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorManger.k2, ColorManger.k1],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // HomeFollowAppBarWidget
                HomeFollowAppBarWidget(),
                SizedBox(height: context.height * 0.009),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 65),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          // Fans
                          HomeFollowRichTextWidget(
                            number: '368  ',
                            title: 'Fans',
                            onTap: () {
                              setState(() {
                                homeFollowEnum = HomeFollowEnum.fans;
                              });
                            },
                          ),
                          SizedBox(height: context.height * 0.004),
                          // Fans Divider
                          homeFollowEnum == HomeFollowEnum.fans
                              ? DividerWidget(
                                onTap: () {
                                  setState(() {
                                    homeFollowEnum = HomeFollowEnum.fans;
                                  });
                                },
                                width: context.width * 0.20,
                                height: 1.5,
                              )
                              : Container(),
                        ],
                      ),
                      // Center Divider
                      DividerWidget(height: context.height * 0.015, width: 1.5),
                      // Pioneers
                      Column(
                        children: [
                          HomeFollowRichTextWidget(
                            number: '175  ',
                            title: 'Pioneers',
                            onTap: () {
                              setState(() {
                                homeFollowEnum = HomeFollowEnum.pioneers;
                              });
                            },
                          ),
                          SizedBox(height: context.height * 0.004),
                          // Pioneers Divider
                          homeFollowEnum == HomeFollowEnum.pioneers
                              ? DividerWidget(
                                onTap: () {
                                  setState(() {
                                    homeFollowEnum = HomeFollowEnum.pioneers;
                                  });
                                },
                                width: context.width * 0.20,
                                height: 1.5,
                              )
                              : Container(),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: context.height * 0.016),
                // TextFormFiled
                HomeFollowTextFormFieldWidget(
                  searchController: searchController,
                ),
                SizedBox(height: context.height * 0.020),
                // homeFollowEnum > PioneersWidget > FansWidget
                homeFollowEnum == HomeFollowEnum.pioneers
                    ? PioneersWidget()
                    : FansWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
