import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/components/show_custom_top_snack_bar.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/router/router.dart';
import '../../home_page/widget/social_post_card.dart';
import '../widget/user_appbar_widget.dart';

@RoutePage()
class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.kOne, AppColors.kTwo],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: [
            UserAppBarWidget(),
            SizedBox(height: context.height * 0.021),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomPrimaryButton(
                  title: 'Chase',
                  backGroundColor: AppColors.kTurquoiseBlue,
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 56,
                    vertical: 9.5,
                  ),
                  borderRadius: BorderRadius.circular(31),
                  style: context.kTextTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.kWhite,
                  ),
                  onTap: () {
                    showCustomErrorMessage(context, message: "COMING SOON");
                  },
                ),
                CustomPrimaryButton(
                  title: 'message',
                  backGroundColor: AppColors.kWhite,
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 56,
                    vertical: 9.5,
                  ),
                  borderRadius: BorderRadius.circular(31),
                  style: context.kTextTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.kTurquoiseBlue,
                  ),
                  onTap: () {
                    showCustomErrorMessage(context, message: "COMING SOON");
                  },
                ),
              ],
            ),
            SizedBox(height: context.height * 0.021),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return PostCardWidget(
                  commentOnTap: () {
                    context.router.push(CommentRoute());
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
