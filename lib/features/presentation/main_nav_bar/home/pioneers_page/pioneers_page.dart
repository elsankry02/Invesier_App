import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/router/router.dart';

import '../../../../../core/components/custom_circuler_progress.dart';
import '../../../../../core/components/custom_no_posts_widget.dart';
import '../../../../../core/components/custom_post_widget.dart';
import '../../../../../core/constant/app_images.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../data/providers/get/get_pioneers_posts_provider.dart';

class PioneersPage extends ConsumerStatefulWidget {
  const PioneersPage({super.key});

  @override
  ConsumerState<PioneersPage> createState() => _PioneersPageState();
}

class _PioneersPageState extends ConsumerState<PioneersPage> {
  @override
  void initState() {
    Future.microtask(() {
      ref.read(getPioneersPostsProvider.notifier).getPioneersPosts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(getPioneersPostsProvider);
    if (state is GetPioneersPostsSuccess) {
      if (state.getPioneersPosts.isEmpty) {
        return CustomNoPostsWidget(
          title: context.kAppLocalizations.nopioneerspoststodisplay,
        );
      }
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: state.getPioneersPosts.length,
        itemBuilder: (context, index) {
          final data = state.getPioneersPosts[index];
          return CustomPostWidget(
            imageUrl: data.user.avatarUrl ?? AppImages.ImageNetwork,
            name: data.user.name,
            username:
                "@${data.user.username ?? context.kAppLocalizations.username}",
            content: data.content,
            postImage: '',
            growthNumber: data.upvotesCount.toString(),
            declineNumber: data.downvotesCount.toString(),
            commentNumber: data.commentsCount.toString(),
            commentOnTap: () => context.router.push(PostRoute(postId: data.id)),
          );
        },
      );
    } else if (state is GetPioneersPostsFailure) {
      return Center(child: Text(state.errMessage));
    } else if (state is GetPioneersPostsLoading) {
      return CustomCircularProgressIndicator();
    }
    return SizedBox();
  }
}
