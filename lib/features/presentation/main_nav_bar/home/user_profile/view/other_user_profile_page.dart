import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/components/coustom_pop_menu_widget.dart';
import '../../../../../../core/components/custom_no_posts_widget.dart';
import '../../../../../../core/components/custom_post_widget.dart';
import '../../../../../../core/constant/app_images.dart';
import '../../../../../../core/constant/app_svgs.dart';
import '../../../../../data/providers/get/get_user_posts_provider.dart';

import '../../../../../../core/components/custom_circuler_progress.dart';
import '../../../../../../core/components/custom_primary_button.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/func/show_top_snack_bar.dart';
import '../../../../../data/providers/get/get_user_profile_provider.dart';
import '../widget/other_user_profile_appbar.dart';

@RoutePage()
class OtherUserProfilePage extends ConsumerStatefulWidget {
  final String username;
  const OtherUserProfilePage({super.key, required this.username});

  @override
  ConsumerState<OtherUserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends ConsumerState<OtherUserProfilePage> {
  @override
  void initState() {
    Future.microtask(() {
      ref
          .read(getUserProfileProvider.notifier)
          .getUserProfile(userName: widget.username);

      ref
          .read(getUserPostsProvider.notifier)
          .getUserPosts(username: widget.username);
    });
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
                  return OtherUserProfileAppBar(
                    getUserProfileModel: state.getUserProfileModel,
                  );
                } else if (state is GetUserProfileFailure) {
                  return Text(
                    state.errMessage,
                    textAlign: TextAlign.center,
                    style: context.kTextTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  );
                } else if (state is GetUserProfileLoading) {
                  return CustomCircularProgressIndicator();
                }
                return SizedBox();
              },
            ),
            SizedBox(height: context.height * 0.017),
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
            SizedBox(height: context.height * 0.018),
            Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(getUserPostsProvider);
                if (state is GetUserPostsSuccess) {
                  if (state.getUserPosts.isEmpty) {
                    return CustomNoPostsWidget(
                      title: context.kAppLocalizations.nopoststodisplay,
                    );
                  }
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.getUserPosts.length,
                    itemBuilder: (context, index) {
                      final data = state.getUserPosts[index];
                      return CustomPostWidget(
                        imageUrl: data.user.avatarUrl ?? AppImages.ImageNetwork,
                        name: data.user.name ?? context.kAppLocalizations.name,
                        username:
                            "@${data.user.username ?? context.kAppLocalizations.username}",
                        content: data.content,
                        postImage: "",
                        growth: data.upvotesCount.toString(),
                        decline: data.downvotesCount.toString(),
                        comment: data.commentsCount.toString(),
                        trailing: CustomPopMenuWidget(
                          firstTitle: "Pin Post",
                          secondTitle: "Delete",
                          firstSvg: AppSvgs.kPin,
                          secondSvg: AppSvgs.kDelete,
                        ),
                      );
                    },
                  );
                }
                if (state is GetUserPostsFailure) {
                  return Text(
                    state.errMessage,
                    textAlign: TextAlign.center,
                    style: context.kTextTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  );
                }
                if (state is GetUserPostsLoading) {
                  return CustomCircularProgressIndicator();
                }
                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
