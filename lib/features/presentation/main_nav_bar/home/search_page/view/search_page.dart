import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/components/custom_no_posts_widget.dart';
import 'package:invesier/core/func/show_top_snack_bar.dart';
import 'package:invesier/features/data/providers/get/get_user_profile_provider.dart';
import 'package:invesier/features/presentation/main_nav_bar/home/search_page/widget/search_tile_widget.dart';

import '../../../../../../core/components/custom_icon_button.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/extension/extension.dart';
import '../widget/home_follow_textformfield_widget.dart';

@RoutePage()
class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.kOne, AppColors.kTwo],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.only(top: context.height * 0.025),
            children: [
              Row(
                children: [
                  // Custom IconButton
                  CustomIconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.kWhite,
                    ),
                    onPressed: () {
                      context.router.maybePop();
                    },
                  ),
                  // HomeFollow TextFormField Widget
                  Expanded(
                    child: HomeFollowTextFormFieldWidget(
                      onFieldSubmitted: (value) {
                        log(value.toString());
                        ref
                            .read(getUserProfileProvider.notifier)
                            .getUserProfile(username: value.trim());
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.height * 0.020),
              Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(getUserProfileProvider);
                  if (state is GetUserProfileSuccess) {
                    return SearchTileWidget(
                      getUserProfileModel: state.userData,
                    );
                  } else if (state is GetUserProfileFailure) {
                    return ErrorMessage(context, message: state.errMessage);
                  } else if (state is GetUserProfileLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return CustomNoPostsWidget(
                    title: context.kAppLocalizations.nopoststodisplay,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
