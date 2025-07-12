import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/constant/color_manger.dart';
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
            colors: [ColorManger.k1, ColorManger.k2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: [
            // Personal AppBar Widget
            PersonalAppBarWidget(),
            SizedBox(height: context.height * 0.021),
            // ChaseOrPostsContainer
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
                color: ColorManger.kWhite,
              ),
              onTap: () {
                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.info(
                    backgroundColor: ColorManger.kSecondary,
                    message: "COMING SOON",
                  ),
                );
              },
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
