import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/components/coustom_pop_menu_widget.dart';
import '../../../../../../core/components/custom_appbar_widget.dart';
import '../../../../../../core/components/custom_comment_button_sheet.dart';
import '../../../../../../core/components/custom_post_widget.dart';
import '../../../../../../core/constant/app_colors.dart';
import '../../../../../../core/constant/app_svgs.dart';
import '../../../../../../core/extension/extension.dart';
import '../widget/reply_post_widget.dart';

@RoutePage()
class PostPage extends StatelessWidget {
  const PostPage({super.key});

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
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                // ReplyWidget
                return ReplyPostWidget(
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
