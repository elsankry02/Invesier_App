import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/router/router.dart';
import '../../home_page/widget/post_card_widget.dart';
import '../widget/personal_appbar_widget.dart';

@RoutePage()
class PersonalProfilePage extends StatelessWidget {
  const PersonalProfilePage({super.key});

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
            // Personal AppBar Widget
            PersonalAppBarWidget(),
            SizedBox(height: context.height * 0.021),
            // Chase Or Posts Container
            CustomPrimaryButton(
              title: 'My Post',
              borderColor: Colors.transparent,
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 62,
                vertical: 9.5,
              ),
              radius: 31,
              style: context.kTextTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.kWhite,
              ),
            ),
            SizedBox(height: context.height * 0.021),
            // builder
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return PostCardWidget(
                  commentOnTap: () {
                    // CommentRoute
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
