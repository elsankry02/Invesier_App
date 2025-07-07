import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomPrimaryButton(
                  title: 'Chase',
                  titleColor: ColorManger.kWhite,
                  borderColor: ColorManger.kTurquoiseBlue,
                  backGroundColor: ColorManger.kTurquoiseBlue,
                  paddingVertical: 10,
                  marginHorizontal: 0,
                  paddingHorizontal: 62,
                  radius: 31,
                  onTap: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Comming Soon")));
                  },
                ),
                CustomPrimaryButton(
                  title: 'message',
                  titleColor: ColorManger.kTurquoiseBlue,
                  borderColor: ColorManger.kWhite,
                  backGroundColor: ColorManger.kWhite,
                  paddingVertical: 10,
                  marginHorizontal: 0,
                  paddingHorizontal: 62,
                  radius: 31,
                  onTap: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Comming Soon")));
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
