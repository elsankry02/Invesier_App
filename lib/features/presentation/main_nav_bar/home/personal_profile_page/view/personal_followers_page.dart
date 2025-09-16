import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/constant/app_enums.dart';
import 'package:invesier/features/presentation/main_nav_bar/home/personal_profile_page/widget/personal_followers_appbar_widget.dart';
import 'package:invesier/features/presentation/main_nav_bar/home/personal_profile_page/widget/personal_pioneers_widget.dart';

import '../../../../../../core/components/custom_divider_widget.dart';
import '../../../../../../core/components/custom_followers_number_widget.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../data/providers/get/get_authenticated_user_provider.dart';
import '../../search_page/widget/search_text_form_field_widget.dart';
import '../widget/personal_fans_widget.dart';

@RoutePage()
class PersonalFollowersPage extends StatefulWidget {
  final FollowersTabType initialTab;
  const PersonalFollowersPage({super.key, required this.initialTab});
  @override
  State<PersonalFollowersPage> createState() => _PersonalFollowersPageState();
}

class _PersonalFollowersPageState extends State<PersonalFollowersPage> {
  FollowersTabType selectedTab = FollowersTabType.fans;
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
                        PersonalFollowersAppBarWidget(
                          userModel: state.userModel,
                        ),
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
                                  CustomFollowersNumberWidget(
                                    number: state.userModel.fansCount,
                                    title: local.fans,
                                    onTap: () {
                                      setState(() {
                                        selectedTab = FollowersTabType.fans;
                                      });
                                    },
                                  ),
                                  SizedBox(height: context.height * 0.004),
                                  // Fans Divider
                                  selectedTab == FollowersTabType.fans
                                      ? CustomDividerWidget(
                                        onTap: () {
                                          setState(() {
                                            selectedTab = FollowersTabType.fans;
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
                                  CustomFollowersNumberWidget(
                                    number: state.userModel.pioneersCount,
                                    title: local.pioneers,
                                    onTap: () {
                                      setState(() {
                                        selectedTab = FollowersTabType.pioneers;
                                      });
                                    },
                                  ),
                                  SizedBox(height: context.height * 0.004),
                                  // Pioneers Divider
                                  selectedTab == FollowersTabType.pioneers
                                      ? CustomDividerWidget(
                                        onTap: () {
                                          setState(() {
                                            selectedTab =
                                                FollowersTabType.pioneers;
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
                        SearchTextFormFieldWidget(
                          searchController: searchController,
                        ),
                        SizedBox(height: context.height * 0.020),
                        // homeFollowEnum > PioneersWidget > FansWidget
                        selectedTab == FollowersTabType.pioneers
                            ? PersonalPioneersWidget()
                            : PersonalFansWidget(),
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
