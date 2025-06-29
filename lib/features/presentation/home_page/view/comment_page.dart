import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/components/custom_show_model_button_add_comment_widget.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/extension/extension.dart';
import 'package:invesier/features/presentation/home_page/widget/post_card_widget.dart';
import 'package:invesier/features/presentation/home_page/widget/reply_widget.dart';

@RoutePage()
class CommentPage extends StatelessWidget {
  const CommentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorManger.k2, ColorManger.k1],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              //! Post Card Widget
              PostCardWidget(
                onTap: () {
                  showModalBottomSheet(
                    isDismissible: false,
                    context: context,
                    builder: (context) {
                      //! Add Comment
                      return CustomShowModelButtonAddCommentWidget(
                        title: 'Add Comment',
                        hintText: 'Share your comment',
                        titleButton: 'Comment',
                        vertical: 5,
                        radius: 8,
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
                    //! ReplyWidget
                    return ReplyWidget(
                      onTap: () {
                        showModalBottomSheet(
                          isDismissible: false,
                          context: context,
                          builder: (context) {
                            //! Add Comment
                            return CustomShowModelButtonAddCommentWidget(
                              title: 'Reply',
                              hintText: 'Type your reply',
                              titleButton: 'Reply',
                              vertical: 5,
                              radius: 8,
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
