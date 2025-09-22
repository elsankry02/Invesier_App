import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/components/custom_circuler_progress.dart';
import 'package:invesier/features/data/providers/get/get_user_profile_provider.dart';

import '../../../../../../core/components/custom_no_posts_widget.dart';
import '../../../../../../core/components/custom_primary_button.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/func/show_top_snack_bar.dart';
import '../widget/user_appbar_widget.dart';

@RoutePage()
class UserProfilePage extends ConsumerStatefulWidget {
  final String username;
  const UserProfilePage({super.key, required this.username});

  @override
  ConsumerState<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends ConsumerState<UserProfilePage> {
  @override
  void initState() {
    ref
        .read(getUserProfileProvider.notifier)
        .getUserProfile(userName: widget.username);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.kOne, AppColors.kTwo],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: [
            Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(getUserProfileProvider);
                if (state is GetUserProfileSuccess) {
                  return UserAppBarWidget(
                    getUserProfileModel: state.getUserProfileModel,
                  );
                } else if (state is GetUserProfileFailure) {
                  return Center(child: Text(state.errMessage));
                } else if (state is GetUserProfileLoading) {
                  return CustomCircularProgressIndicator();
                }
                return SizedBox();
              },
            ),
            SizedBox(height: context.height * 0.021),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomPrimaryButton(
                  title: local.chase,
                  backGroundColor: AppColors.kTurquoiseBlue,
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 56,
                    vertical: 9.5,
                  ),
                  borderRadius: BorderRadius.circular(31),
                  style: context.kTextTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.kWhite,
                  ),
                  onTap: () {
                    ErrorMessage(context, message: local.comingsoon);
                  },
                ),
                CustomPrimaryButton(
                  title: local.message,
                  backGroundColor: AppColors.kWhite,
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: context.height * 0.056,
                    vertical: context.height * 0.010,
                  ),
                  borderRadius: BorderRadius.circular(31),
                  style: context.kTextTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.kTurquoiseBlue,
                  ),
                  onTap: () {
                    ErrorMessage(context, message: local.comingsoon);
                  },
                ),
              ],
            ),
            SizedBox(height: context.height * 0.021),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [CustomNoPostsWidget(title: local.nopoststodisplay)],
            ),
          ],
        ),
      ),
    );
  }
}
