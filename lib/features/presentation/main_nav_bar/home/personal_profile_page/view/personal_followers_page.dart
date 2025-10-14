import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/constant/app_text_theme.dart';

import '../../../../../../core/components/custom_circuler_progress.dart';
import '../../../../../../core/components/custom_divider_widget.dart';
import '../../../../../../core/components/custom_followers_number_widget.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/constant/app_enums.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../data/providers/get/get_authenticated_user_provider.dart';
import '../../search_page/widget/search_text_form_field_widget.dart';
import '../widget/personal_fans_widget.dart';
import '../widget/personal_followers_appbar_widget.dart';
import '../widget/personal_pioneers_widget.dart';

@RoutePage()
class PersonalFollowersPage extends StatefulWidget {
  final FollowersTabType initialTab;
  final int initialPage;
  const PersonalFollowersPage({
    super.key,
    required this.initialTab,
    required this.initialPage,
  });
  @override
  State<PersonalFollowersPage> createState() => _PersonalFollowersPageState();
}

class _PersonalFollowersPageState extends State<PersonalFollowersPage> {
  late FollowersTabType initialTab;
  late PageController pageController;
  final pioneersController = TextEditingController();
  final fansController = TextEditingController();

  @override
  void initState() {
    initialTab = widget.initialTab;
    pageController = PageController(initialPage: widget.initialPage);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    pioneersController.dispose();
    fansController.dispose();
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
            child: Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(getAuthenticatedUserProvider);
                if (state is GetAuthenticatedUserSuccess) {
                  return Column(
                    children: [
                      // HomeFollowAppBarWidget
                      PersonalFollowersAppBarWidget(userModel: state.userModel),
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
                                  number: 0,
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
                                  number: 0,
                                  title: local.pioneers,
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 1.5,
                                      color:
                                          initialTab ==
                                                  FollowersTabType.pioneers
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
                            // Fans
                            ListView(
                              children: [
                                SearchTextFormFieldWidget(
                                  onChanged: (value) {},
                                  autofocus: false,
                                  searchController: pioneersController,
                                ),
                                SizedBox(height: context.height * 0.020),
                                PersonalFansWidget(),
                              ],
                            ),
                            // pioneers
                            ListView(
                              children: [
                                SearchTextFormFieldWidget(
                                  autofocus: false,
                                  onChanged: (value) {},
                                  searchController: pioneersController,
                                ),
                                SizedBox(height: context.height * 0.020),
                                PersonalPioneersWidget(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (state is GetAuthenticatedUserFaliure) {
                  return Text(
                    state.errMessage,
                    textAlign: TextAlign.center,
                    style: AppTextTheme.kTitleMedium(
                      context,
                      fontWeight: FontWeight.w700,
                    ),
                  );
                }
                {
                  return CustomCircularProgressIndicator();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
