import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/components/custom_circuler_progress.dart';
import 'package:invesier/core/extension/extension.dart';

import '../../../../../data/providers/get/get_posts_provider.dart';
import '../widget/social_post_card.dart';

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
        return Center(child: Text(context.kAppLocalizations.nopoststodisplay));
      }
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: state.data.length,
        itemBuilder: (context, index) {
          return SocialPostCardWidget();
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
