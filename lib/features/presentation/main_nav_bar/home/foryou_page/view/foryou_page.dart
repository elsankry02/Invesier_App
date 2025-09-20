import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../../core/components/custom_no_posts_widget.dart';
import '../../../../../../core/components/custom_post_widget.dart';
import '../../../../../../core/constant/app_images.dart';

import '../../../../../../core/components/custom_circuler_progress.dart';
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
          title: context.kAppLocalizations.nopoststodisplay,
        );
      }
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: state.data.length,
        itemBuilder: (context, index) {
          final data = state.data[index];
          return CustomPostWidget(
            imagePost: AppImages.kBoyFour,
            avatarUrl: data.user.avatarUrl,
            name: data.user.name,
            userName: data.user.username,
            postTitle: data.content,
            upvotesCount: data.upvotesCount,
            downvotesCount: data.downvotesCount,
            commentsCount: data.commentsCount,
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
