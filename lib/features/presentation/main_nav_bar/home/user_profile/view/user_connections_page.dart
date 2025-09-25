import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../data/providers/get/get_user_fans_provider.dart';
import '../../../../../data/providers/get/get_user_pioneers_provider.dart';
import '../../search_page/widget/search_text_form_field_widget.dart';
import '../widget/user_fans_widget.dart';
import '../widget/user_pioneers_widget.dart';

import '../../../../../../core/components/custom_divider_widget.dart';
import '../../../../../../core/components/custom_followers_number_widget.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/constant/app_enums.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../data/models/get/get_user_profile_model.dart';
import '../widget/user_connections_appbar.dart';

@RoutePage()
class UserConnectionsPage extends ConsumerStatefulWidget {
  final FollowersTabType initialTab;
  final GetUserProfileModel getUserProfileModel;
  final int initialPage;

  const UserConnectionsPage({
    super.key,
    required this.initialPage,
    required this.initialTab,
    required this.getUserProfileModel,
  });
  @override
  ConsumerState<UserConnectionsPage> createState() =>
      _UserConnectionsPageState();
}

class _UserConnectionsPageState extends ConsumerState<UserConnectionsPage> {
  final pioneersController = TextEditingController();
  final fansController = TextEditingController();
  late FollowersTabType initialTab;
  late PageController pageController;

  @override
  void initState() {
    initialTab = widget.initialTab;
    pageController = PageController(initialPage: widget.initialPage);
    super.initState();
  }

  @override
  void dispose() {
    fansController.dispose();
    pioneersController.dispose();
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
                UserConnectionsAppBar(
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
                                    initialTab == FollowersTabType.fans
                                        ? AppColors.kWhite
                                        : Colors.transparent,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                pageController.animateToPage(
                                  0,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                                initialTab = FollowersTabType.fans;
                                pioneersController.clear();
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
                                    initialTab == FollowersTabType.pioneers
                                        ? AppColors.kWhite
                                        : Colors.transparent,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                pageController.animateToPage(
                                  1,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                                initialTab = FollowersTabType.pioneers;
                                fansController.clear();
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.height * 0.020),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Column(
                        children: [
                          SearchTextFormFieldWidget(
                            autofocus: false,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                ref
                                    .read(getUserFansProvider.notifier)
                                    .getUserFans(
                                      username:
                                          widget.getUserProfileModel.username ??
                                          context.kAppLocalizations.username,
                                      search: value.toLowerCase().trim(),
                                    );
                              }
                            },
                            searchController: fansController,
                          ),
                          SizedBox(height: context.height * 0.020),
                          UserFansWidget(
                            username:
                                widget.getUserProfileModel.username ??
                                context.kAppLocalizations.username,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SearchTextFormFieldWidget(
                            autofocus: false,
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                ref
                                    .read(getUserPioneersProvider.notifier)
                                    .getUserPioneers(
                                      search: value.toLowerCase().trim(),
                                      username:
                                          widget.getUserProfileModel.username ??
                                          context.kAppLocalizations.username,
                                    );
                              }
                            },
                            searchController: pioneersController,
                          ),
                          SizedBox(height: context.height * 0.020),
                          UserPioneersWidget(
                            username:
                                widget.getUserProfileModel.username ??
                                context.kAppLocalizations.username,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
