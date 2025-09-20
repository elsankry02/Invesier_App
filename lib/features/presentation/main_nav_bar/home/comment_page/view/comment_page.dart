import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/components/coustom_pop_menu_widget.dart';
import '../../../../../../core/components/custom_appbar_widget.dart';
import '../../../../../../core/components/custom_post_widget.dart';
import '../../../../../../core/constant/app_images.dart';
import '../../../../../../core/constant/app_svgs.dart';
import '../widget/reply_post_widget.dart';

import '../../../../../../core/components/custom_comment_button_sheet.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/extension/extension.dart';

@RoutePage()
class CommentPage extends StatelessWidget {
  const CommentPage({super.key});

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
            CustomPostWidget(
              name: 'Mohamed Ibrahim',
              userName: '@elsankry02',
              postTitle:
                  'Today I learned something new in Flutter and it feels amazing to keep growing step by step',
              avatarUrl: AppImages.kBoyFour,
              imagePost: AppImages.kBoyOne,
              upvotesCount: 2311,
              downvotesCount: 1,
              commentsCount: 546,
              trailing: CustomPopMenuWidget(
                firstTitle: "Pin Post",
                secondTitle: "Delete",
                firstSvg: AppSvgs.kPin,
                secondSvg: AppSvgs.kDelete,
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
                      borderRadius: BorderRadius.circular(8),
                      style: context.kTextTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.kDivider,
                      ),
                    );
                  },
                );
              },
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                // ReplyWidget
                return ReplyPostWidget(
                  avatarUrl: AppImages.kBoyOne,
                  name: 'mohamed',
                  userName: 'adham',
                  imagePost: AppImages.kBoyFive,
                  upvotesCount: 4444,
                  downvotesCount: 555,
                  commentsCount: 5687,
                  onTap: () {
                    showModalBottomSheet(
                      isDismissible: false,
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
                          borderRadius: BorderRadius.circular(8),
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
