import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/components/coustom_pop_menu_widget.dart';
import '../../../../../../core/components/custom_appbar_widget.dart';
import '../../../../../../core/components/custom_circuler_progress.dart';
import '../../../../../../core/components/custom_comment_button_sheet.dart';
import '../../../../../../core/components/custom_post_widget.dart';
import '../../../../../../core/components/custom_reply_post_widget.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/constant/app_images.dart';
import '../../../../../../core/constant/app_svgs.dart';
import '../../../../../../core/extension/extension.dart';
import '../../../../../../core/func/show_top_snack_bar.dart';
import '../../../../../../core/router/router.dart';
import '../../../../../data/providers/delete/delete_comment.dart';
import '../../../../../data/providers/delete/delete_post_provider.dart';
import '../../../../../data/providers/get/get_list_post_comments_provider.dart';
import '../../../../../data/providers/get/get_post_provider.dart';
import '../../../../../data/providers/post/create_post_comment_provider.dart';

@RoutePage()
class PostPage extends ConsumerStatefulWidget {
  final int postId;
  const PostPage({required this.postId, super.key});

  @override
  ConsumerState<PostPage> createState() => _PostPageState();
}

class _PostPageState extends ConsumerState<PostPage> {
  final commentController = TextEditingController();

  @override
  void initState() {
    Future.microtask(() {
      ref.read(getPostProvider.notifier).getPost(postId: widget.postId);
      ref
          .read(getListPostCommentsProvider.notifier)
          .getListPostComments(postId: widget.postId);
    });
    super.initState();
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  Future<void> createPostComment() async {
    if (commentController.text.trim().isEmpty) {
      ErrorMessage(
        context,
        message: context.kAppLocalizations.pleasewritecomment,
      );
      return;
    }
    final notifier = ref.read(createPostCommnetProvider.notifier);
    await notifier.createPostComment(
      content: commentController.text.trim(),
      postId: widget.postId,
    );
    commentController.clear();
  }

  Future<void> deleteCommentOnTap({required int id}) async {
    await ref.read(deleteCommentProvider.notifier).deleteComment(id: id);
    await ref
        .read(getListPostCommentsProvider.notifier)
        .getListPostComments(postId: widget.postId);
  }

  Future<void> deletePostOnTap({required int id}) async {
    await ref.read(deletePostProvider.notifier).deletePost(id: id);
    context.router.maybePop();
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
                    createdAt: data.createdAt,
                    imageUrl: data.user.avatarUrl ?? AppImages.ImageNetwork,
                    name: data.user.name ?? context.kAppLocalizations.name,
                    username:
                        "@${data.user.username ?? context.kAppLocalizations.username}",
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
                      deleteOnTap: () => deletePostOnTap(id: data.id),
                    ),
                    commentOnTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          // Add Comment
                          return Consumer(
                            builder: (context, ref, child) {
                              final state = ref.watch(
                                createPostCommnetProvider,
                              );
                              ref.listen(createPostCommnetProvider, (_, state) {
                                if (state is CreatePostCommentFailure) {
                                  ErrorMessage(
                                    context,
                                    message: state.errMessage,
                                  );
                                  return;
                                }
                                if (state is CreatePostCommentSuccess) {
                                  SuccessMessage(
                                    context,
                                    message:
                                        context
                                            .kAppLocalizations
                                            .commentpublishsuccessfully,
                                  );
                                  context.router.maybePop();
                                  ref
                                      .read(
                                        getListPostCommentsProvider.notifier,
                                      )
                                      .getListPostComments(
                                        postId: widget.postId,
                                      );
                                }
                              });
                              return CustomCommentBottomSheet(
                                commentController: commentController,
                                isLoading: state is CreatePostCommentLoading,
                                commentOnTap: () => createPostComment(),
                                hintText: local.addcommentbotton,
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
            Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(getListPostCommentsProvider);
                if (state is GetListPostCommentsSuccess) {
                  if (state.getListPostComments.isEmpty) {
                    return Text(
                      context.kAppLocalizations.nopostcommenttodisplay,
                      textAlign: TextAlign.center,
                      style: context.kTextTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    );
                  }
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.getListPostComments.length,
                    itemBuilder: (context, index) {
                      final data = state.getListPostComments[index];
                      return CustomReplyPostWidget(
                        createdAt: data.createdAt,
                        imageUrl: data.user.avatarUrl ?? AppImages.ImageNetwork,
                        name: data.user.name ?? context.kAppLocalizations.name,
                        username:
                            "@${data.user.username ?? context.kAppLocalizations.username}",
                        content: data.content,
                        postImage: '',
                        imageOnTap:
                            () => context.router.push(
                              OtherUserProfileRoute(
                                username:
                                    data.user.username ??
                                    context.kAppLocalizations.username,
                              ),
                            ),
                        growthNumber: data.upvotesCount.toString(),
                        declineNumber: data.downvotesCount.toString(),
                        deleteOnTap: () => deleteCommentOnTap(id: data.id),
                        replyOnTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return CustomCommentBottomSheet(
                                hintText: local.addreply,
                                commentOnTap: () {},
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
                  );
                } else if (state is GetListPostCommentsFailure) {
                  return Text(
                    state.errMessage,
                    textAlign: TextAlign.center,
                    style: context.kTextTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  );
                } else if (state is GetListPostCommentsLoading) {
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
