import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/components/custom_circuler_progress.dart';
import 'package:invesier/core/constant/app_images.dart';
import 'package:invesier/features/data/providers/get/get_post_provider.dart';

import '../../../../../../core/components/coustom_pop_menu_widget.dart';
import '../../../../../../core/components/custom_appbar_widget.dart';
import '../../../../../../core/components/custom_comment_button_sheet.dart';
import '../../../../../../core/components/custom_post_widget.dart';
import '../../../../../../core/components/custom_reply_post_widget.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/constant/app_svgs.dart';
import '../../../../../../core/extension/extension.dart';

@RoutePage()
class PostPage extends ConsumerStatefulWidget {
  final int postId;
  const PostPage({required this.postId, super.key});

  @override
  ConsumerState<PostPage> createState() => _PostPageState();
}

class _PostPageState extends ConsumerState<PostPage> {
  @override
  void initState() {
    Future.microtask(() {
      ref.read(getPostProvider.notifier).getPost(postId: widget.postId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.kTwo, AppColors.kOne],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: ListView(
          children: [
            SizedBox(height: context.height * 0.025),
            CustomAppBarWidget(title: context.kAppLocalizations.post),
            // Post Card Widget
            Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(getPostProvider);
                if (state is GetPostSuccess) {
                  final data = state.getPost;
                  return CustomPostWidget(
                    imageUrl: data.user.avatarUrl ?? AppImages.ImageNetwork,
                    name: data.user.name ?? context.kAppLocalizations.name,
                    username:
                        data.user.username ??
                        context.kAppLocalizations.username,
                    content: data.content,
                    postImage: '',
                    growthNumber: data.upvotesCount.toString(),
                    declineNumber: data.downvotesCount.toString(),
                    commentNumber: data.commentsCount.toString(),
                    trailing: CustomPopMenuWidget(
                      pinTitle: context.kAppLocalizations.pinpost,
                      pinSvg: AppSvgs.kPin,
                      pinOnTap: () {},
                      deleteTitle: context.kAppLocalizations.delete,
                      deleteSvg: AppSvgs.kDelete,
                      deleteOnTap: () {},
                    ),
                    commentOnTap: () {
                      showModalBottomSheet(
                        isDismissible: false,
                        context: context,
                        builder: (context) {
                          // Add Comment
                          return CustomCommentBottomSheet(
                            title: local.addcomment,
                            hintText: local.shareyourcomment,
                            titleButton: local.comment,
                            padding: EdgeInsets.symmetric(
                              horizontal: context.height * 0.020,
                              vertical: context.height * 0.005,
                            ),
                            borderRadius: BorderRadius.circular(
                              context.height * 0.008,
                            ),
                            style: context.kTextTheme.labelMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.kDivider,
                            ),
                          );
                        },
                      );
                    },
                  );
                } else if (state is GetPostFailure) {
                  return Text(
                    state.errmessage,
                    textAlign: TextAlign.center,
                    style: context.kTextTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  );
                }
                {
                  return CustomCircularProgressIndicator();
                }
              },
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                // ReplyWidget
                return CustomReplyPostWidget(
                  imageUrl: '',
                  name: '',
                  username: '',
                  content: '',
                  postImage: '',
                  growthNumber: '',
                  declineNumber: '',
                  comment: '',
                  replyOnTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        // Add Comment
                        return CustomCommentBottomSheet(
                          title: local.reply,
                          hintText: local.typeyourreply,
                          titleButton: local.reply,
                          padding: EdgeInsets.symmetric(
                            horizontal: context.height * 0.020,
                            vertical: context.height * 0.005,
                          ),
                          borderRadius: BorderRadius.circular(
                            context.height * 0.008,
                          ),
                          style: context.kTextTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.kDivider,
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
