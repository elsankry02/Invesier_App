import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/constant/app_colors.dart';
import 'package:invesier/features/presentation/home/foryou_page/widget/social_post_card.dart';
import 'package:invesier/features/provider/get/get_posts_provider.dart';

class ForYouWidget extends ConsumerStatefulWidget {
  const ForYouWidget({super.key});

  @override
  ConsumerState<ForYouWidget> createState() => _ForYouWidgetState();
}

class _ForYouWidgetState extends ConsumerState<ForYouWidget> {
  @override
  void initState() {
    Future.microtask(() => ref.read(getPostsProvider.notifier).getPosts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(getPostsProvider);
    if (state is GetPostsSuccess) {
      return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: state.getPostsModel.data.length,
        itemBuilder: (context, index) {
          final post = state.getPostsModel.data[index];
          return SocialPostCardWidget(post: post);
        },
      );
    }
    if (state is GetPostsFailure) {
      log(state.errMessage);
      return Center(child: Text(state.errMessage));
    }

    return Center(child: CircularProgressIndicator(color: AppColors.kGray));
  }
}
