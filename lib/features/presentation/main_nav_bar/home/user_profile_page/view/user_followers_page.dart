import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/components/custom_divider_widget.dart';
import '../../../../../../core/components/custom_followers_number_widget.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/constant/app_enums.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../data/models/get/get_user_profile_model.dart';
import '../../search_page/widget/search_text_form_field_widget.dart';
import '../widget/user_fans_widget.dart';
import '../widget/user_followers_appbar.dart';
import '../widget/user_pioneers_widget.dart';

@RoutePage()
class UserFollowersPage extends ConsumerStatefulWidget {
  final FollowersTabType initialTab;
  final GetUserProfileModel getUserProfileModel;
  const UserFollowersPage({
    super.key,
    required this.initialTab,
    required this.getUserProfileModel,
  });
  @override
  ConsumerState<UserFollowersPage> createState() => _UserFollowersPageState();
}

class _UserFollowersPageState extends ConsumerState<UserFollowersPage> {
  FollowersTabType selectedTab = FollowersTabType.fans;
  final searchController = TextEditingController();
  @override
  void initState() {
    selectedTab = widget.initialTab;
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
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
            child: Column(
              children: [
                // HomeFollowAppBarWidget
                UserFollowersAppBarWidget(
                  getUserProfileModel: widget.getUserProfileModel,
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
                            padding: EdgeInsetsDirectional.only(
                              start: context.height * 0.020,
                              end: context.height * 0.020,
                              bottom: context.height * 0.010,
                            ),
                            number: widget.getUserProfileModel.fansCount,
                            title: local.fans,
                            border: Border(
                              bottom: BorderSide(
                                width: 1.5,
                                color:
                                    selectedTab == FollowersTabType.fans
                                        ? AppColors.kWhite
                                        : Colors.transparent,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                selectedTab = FollowersTabType.fans;
                              });
                            },
                          ),
                        ],
                      ),
                      // Center Divider
                      CustomDividerWidget(
                        color: AppColors.kWhite,
                        height: context.height * 0.020,
                        width: 2,
                      ),
                      // Pioneers
                      Column(
                        children: [
                          CustomFollowersNumberWidget(
                            padding: EdgeInsetsDirectional.only(
                              start: context.height * 0.020,
                              end: context.height * 0.020,
                              bottom: context.height * 0.010,
                            ),
                            number: widget.getUserProfileModel.pioneersCount,
                            title: local.pioneers,
                            border: Border(
                              bottom: BorderSide(
                                width: 1.5,
                                color:
                                    selectedTab == FollowersTabType.pioneers
                                        ? AppColors.kWhite
                                        : Colors.transparent,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                selectedTab = FollowersTabType.pioneers;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: context.height * 0.016),
                // TextFormFiled
                SearchTextFormFieldWidget(
                  onChanged: (value) {},
                  autofocus: false,
                  searchController: searchController,
                ),
                SizedBox(height: context.height * 0.020),
                // homeFollowEnum > PioneersWidget > FansWidget
                selectedTab == FollowersTabType.pioneers
                    ? UserPioneersWidget(
                      username:
                          widget.getUserProfileModel.username ??
                          context.kAppLocalizations.username,
                    )
                    : UserFansWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
