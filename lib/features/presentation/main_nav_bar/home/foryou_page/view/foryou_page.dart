import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/router/router.dart';

import '../../../../../../core/components/custom_circuler_progress.dart';
import '../../../../../../core/components/custom_no_posts_widget.dart';
import '../../../../../../core/components/custom_post_widget.dart';
import '../../../../../../core/constant/app_images.dart';
import '../../../../../../core/extension/extension.dart';
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

  @override
  Widget build(BuildContext context) {
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
        itemBuilder: (context, index) {
          final getPosts = state.data[index];
          return CustomPostWidget(
            imageUrl: getPosts.user.avatarUrl ?? AppImages.ImageNetwork,
            name: getPosts.user.name,
            username:
                "@${getPosts.user.username ?? context.kAppLocalizations.username}",
            content: getPosts.content,
            postImage: '',
            growthNumber: getPosts.upvotesCount.toString(),
            declineNumber: getPosts.downvotesCount.toString(),
            commentNumber: getPosts.commentsCount.toString(),
            commentOnTap:
                () => context.router.push(PostRoute(postId: getPosts.id)),
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
