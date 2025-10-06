import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/components/coustom_pop_menu_widget.dart';
import 'package:invesier/core/constant/app_svgs.dart';
import 'package:invesier/core/func/show_top_snack_bar.dart';
import 'package:invesier/features/data/providers/delete/delete_post_provider.dart';

import '../../../../../../core/components/custom_circuler_progress.dart';
import '../../../../../../core/components/custom_no_posts_widget.dart';
import '../../../../../../core/components/custom_post_widget.dart';
import '../../../../../../core/constant/app_images.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/router/router.dart';
import '../../../../../data/providers/get/get_posts_provider.dart';

class ForYouPage extends ConsumerStatefulWidget {
  const ForYouPage({super.key});

  @override
  ConsumerState<ForYouPage> createState() => _ForYouWidgetState();
}

class _ForYouWidgetState extends ConsumerState<ForYouPage> {
  @override
  void initState() {
    Future.microtask(() => ref.read(getPostsProvider.notifier).getPosts());
    super.initState();
  }

  deleteOnTap({required int id}) async {
    ref.read(deletePostProvider.notifier).deletePost(id: id);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(deletePostProvider, (_, state) {
      if (state is DeletePostFailure) {
        ErrorMessage(context, message: state.errmessage);
        return;
      }
      if (state is DeletePostSuccess) {
        SuccessMessage(
          context,
          message: context.kAppLocalizations.postdeletedsuccessfully,
        );
        ref.read(getPostsProvider.notifier).getPosts();
      }
    });
    final state = ref.watch(getPostsProvider);
    if (state is GetPostsSuccess) {
      if (state.data.isEmpty) {
        return CustomNoPostsWidget(
          title: context.kAppLocalizations.noforyoupoststodisplay,
        );
      }
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: state.data.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final getPosts = state.data[index];
          return CustomPostWidget(
            imageUrl: getPosts.user.avatarUrl ?? AppImages.ImageNetwork,
            name: getPosts.user.name,
            username:
                "@${getPosts.user.username ?? context.kAppLocalizations.username}",
            content: getPosts.content,
            postImage: "",
            growthNumber: getPosts.upvotesCount.toString(),
            declineNumber: getPosts.downvotesCount.toString(),
            commentNumber: getPosts.commentsCount.toString(),
            commentOnTap:
                () => context.router.push(PostRoute(postId: getPosts.id)),
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
  }
}
