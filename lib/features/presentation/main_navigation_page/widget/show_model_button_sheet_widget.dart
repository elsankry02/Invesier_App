import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/router/router.dart';
import 'button_sheet_text_widget.dart';

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
        // gradient
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.kHeavyMetal, AppColors.kBackGround],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Post
            ButtonSheetTextWidget(
              title: 'Post',
              onTap: () {
                context.pushRoute(PostRoute());
              },
            ),
            SizedBox(height: 10),
            // Divider
            Divider(thickness: 2),
            SizedBox(height: 10),
            // Live
            ButtonSheetTextWidget(title: 'Live', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
