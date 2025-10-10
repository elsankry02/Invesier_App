import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/components/coustom_pop_menu_widget.dart';
import 'package:invesier/core/components/custom_circuler_progress.dart';
import 'package:invesier/core/components/custom_post_widget.dart';
import 'package:invesier/core/constant/app_images.dart';
import 'package:invesier/core/constant/app_svgs.dart';
import 'package:invesier/core/router/router.dart';
import 'package:invesier/features/data/providers/delete/delete_post_provider.dart';
import 'package:invesier/features/data/providers/get/get_posts_provider.dart';

import '../../../../../../core/components/custom_no_posts_widget.dart';
import '../../../../../../core/components/custom_primary_button.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/extension/extension.dart';
import '../widget/personal_appbar_widget.dart';

@RoutePage()
class PersonalProfilePage extends ConsumerStatefulWidget {
  const PersonalProfilePage({super.key});

  @override
  ConsumerState<PersonalProfilePage> createState() =>
      _PersonalProfilePageState();
}

class _PersonalProfilePageState extends ConsumerState<PersonalProfilePage> {
  Future<void> deleteOnTap({required int id}) async {
    await ref.read(deletePostProvider.notifier).deletePost(id: id);
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
            PersonalAppBarWidget(),
            SizedBox(height: context.height * 0.015),
            CustomPrimaryButton(
              title: local.mypost,
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: context.height * 0.062,
                vertical: context.height * 0.010,
              ),
              borderRadius: BorderRadius.circular(31),
              style: context.kTextTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.kWhite,
              ),
            ),
            SizedBox(height: context.height * 0.015),
            Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(getPostsProvider);
                if (state is GetPostsSuccess) {
                  if (state.data.isEmpty) {
                    return CustomNoPostsWidget(
                      title: context.kAppLocalizations.nopoststodisplay,
                    );
                  }
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final getPosts = state.data[index];
                      return CustomPostWidget(
                        createdAt: getPosts.createdAt,
                        imageUrl:
                            getPosts.user.avatarUrl ?? AppImages.ImageNetwork,
                        name: getPosts.user.name,
                        username:
                            "@${getPosts.user.username ?? context.kAppLocalizations.username}",
                        content: getPosts.content,
                        postImage: "",
                        growthNumber: getPosts.upvotesCount.toString(),
                        declineNumber: getPosts.downvotesCount.toString(),
                        commentNumber: getPosts.commentsCount.toString(),
                        commentOnTap:
                            () => context.router.push(
                              PostRoute(postId: getPosts.id),
                            ),
                        trailing: CustomPopMenuWidget(
                          pinTitle: context.kAppLocalizations.pinpost,
                          deleteTitle: context.kAppLocalizations.deletepost,

                          deleteOnTap: () => deleteOnTap(id: getPosts.id),
                          pinOnTap: () {},
                          pinSvg: AppSvgs.kPin,
                          deleteSvg: AppSvgs.kDelete,
                        ),
                      );
                    },
                  );
                } else if (state is GetPostsFailure) {
                  return Center(child: Text(state.errMessage));
                } else if (state is GetPostsLoading) {
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
