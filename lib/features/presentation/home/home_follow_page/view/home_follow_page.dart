import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/components/custom_divider_widget.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../provider/get/get_authenticated_user_provider.dart';
import '../../search_page/widget/home_follow_textformfield_widget.dart';
import '../widget/fans_widget.dart';
import '../widget/home_follow_appbar.dart';
import '../widget/home_follow_rich_text_widget.dart';
import '../widget/pioneers_widget.dart';

enum FollowTabType { fans, pioneers }

@RoutePage()
class HomeFollowPage extends StatefulWidget {
  final FollowTabType initialTab;
  const HomeFollowPage({super.key, required this.initialTab});
  @override
  State<HomeFollowPage> createState() => _HomeFollowPageState();
}

class _HomeFollowPageState extends State<HomeFollowPage> {
  FollowTabType selectedTab = FollowTabType.fans;
  final searchController = TextEditingController();

  @override
  void initState() {
    selectedTab = widget.initialTab;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.kTwo, AppColors.kOne],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.height * 0.020),
            child: Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(getAuthenticatedUserProvider);

                return state is GetAuthenticatedUserSuccess
                    ? Column(
                      children: [
                        // HomeFollowAppBarWidget
                        HomeFollowAppBarWidget(userModel: state.userModel),
                        SizedBox(height: context.height * 0.009),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: context.height * 0.065,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  // Fans
                                  HomeFollowRichTextWidget(
                                    number: state.userModel.fansCount,
                                    title: local.fans,
                                    onTap: () {
                                      setState(() {
                                        selectedTab = FollowTabType.fans;
                                      });
                                    },
                                  ),
                                  SizedBox(height: context.height * 0.004),
                                  // Fans Divider
                                  selectedTab == FollowTabType.fans
                                      ? CustomDividerWidget(
                                        onTap: () {
                                          setState(() {
                                            selectedTab = FollowTabType.fans;
                                          });
                                        },
                                        width: context.width * 0.20,
                                        height: 1.5,
                                      )
                                      : Container(),
                                ],
                              ),
                              // Center Divider
                              CustomDividerWidget(
                                height: context.height * 0.015,
                                width: 1.5,
                              ),
                              // Pioneers
                              Column(
                                children: [
                                  HomeFollowRichTextWidget(
                                    number: state.userModel.pioneersCount,
                                    title: local.pioneers,
                                    onTap: () {
                                      setState(() {
                                        selectedTab = FollowTabType.pioneers;
                                      });
                                    },
                                  ),
                                  SizedBox(height: context.height * 0.004),
                                  // Pioneers Divider
                                  selectedTab == FollowTabType.pioneers
                                      ? CustomDividerWidget(
                                        onTap: () {
                                          setState(() {
                                            selectedTab =
                                                FollowTabType.pioneers;
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
                        selectedTab == FollowTabType.pioneers
                            ? PioneersWidget()
                            : FansWidget(),
                      ],
                    )
                    : SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
