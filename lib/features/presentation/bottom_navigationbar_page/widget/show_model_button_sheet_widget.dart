import 'package:flutter/material.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/extension/extension.dart';
import 'package:invesier/features/presentation/bottom_navigationbar_page/widget/button_sheet_text_widget.dart';
import 'package:invesier/core/components/custom_show_model_button_add_comment_widget.dart';

class ShowModelButtonSheetWidget extends StatelessWidget {
  const ShowModelButtonSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorManger.kHeavyMetal,
            ColorManger.kBackGround,
            ColorManger.kBackGround,
            ColorManger.kBackGround,
            ColorManger.kBackGround,
            ColorManger.kBackGround,
            ColorManger.kBackGround,
            ColorManger.kBackGround,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            //! Post
            ButtonSheetTextWidget(
              title: 'Post',
              onTap: () {
                showModalBottomSheet(
                  isDismissible: false,
                  context: context,
                  builder: (context) {
                    return CustomShowModelButtonAddCommentWidget(
                      title: 'Add Post',

                      hintText: 'We post money related content.....',
                      titleButton: 'Post now',
                      vertical: 12,
                      radius: 16,
                    );
                  },
                );
              },
            ),
            SizedBox(height: 10),
            Divider(thickness: 2),
            SizedBox(height: 10),
            //! Live
            ButtonSheetTextWidget(title: 'Live', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
