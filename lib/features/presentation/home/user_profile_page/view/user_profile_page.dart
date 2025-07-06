import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constant/color_manger.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/router/router.dart';
import '../../home_page/widget/chase_or_posts_container_widget.dart';
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
            ChaseOrPostsContainerWidget(
              title: 'Chase',
              backGroundColor: ColorManger.kTurquoiseBlue,
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
