import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/custom_comment_button_sheet.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/extension/extension.dart';
import '../../home_page/widget/social_post_card.dart';
import '../widget/reply_widget.dart';

@RoutePage()
class CommentPage extends StatelessWidget {
  const CommentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.kTwo, AppColors.kOne],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Post Card Widget
              PostCardWidget(
                commentOnTap: () {
                  showModalBottomSheet(
                    isDismissible: false,
                    context: context,
                    builder: (context) {
                      // Add Comment
                      return CustomCommentBottomSheet(
                        title: 'Add Comment',
                        hintText: 'Share your comment',
                        titleButton: 'Comment',
                        vertical: 5,
                        radius: 8,
                        style: context.kTextTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.kDivider,
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(height: context.height * 0.012),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    // ReplyWidget
                    return ReplyWidget(
                      onTap: () {
                        showModalBottomSheet(
                          isDismissible: false,
                          context: context,
                          builder: (context) {
                            // Add Comment
                            return CustomCommentBottomSheet(
                              title: 'Reply',
                              hintText: 'Type your reply',
                              titleButton: 'Reply',
                              vertical: 5,
                              radius: 8,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
