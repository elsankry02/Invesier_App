import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../../core/components/custom_primary_button.dart';
import '../../../../../core/constant/color_manger.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/router/router.dart';
import '../../home_page/widget/pop_menu_button_widget.dart';
import '../../home_page/widget/post_card_widget.dart';
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
            colors: [ColorManger.k1, ColorManger.k2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          children: [
            // User AppBar Widget
            UserAppBarWidget(),
            SizedBox(height: context.height * 0.021),
            // Chase Or Posts Container Widget
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomPrimaryButton(
                  title: 'Chase',
                  borderColor: ColorManger.kTurquoiseBlue,
                  backGroundColor: ColorManger.kTurquoiseBlue,
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 56,
                    vertical: 9.5,
                  ),
                  radius: 31,
                  style: context.kTextTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ColorManger.kWhite,
                  ),
                  onTap: () {
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.info(
                        backgroundColor: ColorManger.kTurquoiseBlue,
                        message: "COMING SOON",
                      ),
                    );
                  },
                ),
                CustomPrimaryButton(
                  title: 'message',
                  borderColor: ColorManger.kWhite,
                  backGroundColor: ColorManger.kWhite,
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 56,
                    vertical: 9.5,
                  ),
                  radius: 31,
                  style: context.kTextTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ColorManger.kTurquoiseBlue,
                  ),
                  onTap: () {
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.info(
                        backgroundColor: ColorManger.kHeavyMetal,
                        message: "COMING SOON",
                      ),
                    );
                  },
                ),
              ],
            ),

            SizedBox(height: context.height * 0.021),
            // ListView builder
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return PostCardWidget(
                  trailing: PopMenuButtonWidget(),

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
