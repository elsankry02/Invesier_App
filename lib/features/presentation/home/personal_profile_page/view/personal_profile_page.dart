import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constant/color_manger.dart';
import '../../../../../core/extension/extension.dart';
import '../../../../../core/router/router.dart';
import '../../home_page/widget/chase_or_posts_container_widget.dart';
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
            PersonalAppBarWidget(),
            SizedBox(height: context.height * 0.021),
            //! ChaseOrPostsContainer
            ChaseOrPostsContainerWidget(title: 'My Posts'),
            SizedBox(height: context.height * 0.021),
            //! builder
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
