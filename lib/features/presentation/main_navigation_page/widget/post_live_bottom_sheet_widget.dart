import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../core/components/show_custom_top_snack_bar.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/router/router.dart';
import 'bottom_sheet_button_widget.dart';

class PostLiveBottomSheetWidget extends StatelessWidget {
  const PostLiveBottomSheetWidget({super.key});

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
          colors: [AppColors.kHeavyMetal, AppColors.kBackGround],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            BottomSheetButtonWidget(
              title: "Post",
              onTap: () {
                context.router.maybePop();
                context.router.push(PostRoute());
              },
            ),
            const Divider(thickness: 2),
            BottomSheetButtonWidget(
              title: "Live",
              onTap:
                  () => showCustomErrorMessage(context, message: "COMING SOON"),
            ),
          ],
        ),
      ),
    );
  }
}
