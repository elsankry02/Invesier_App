import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/router/router.dart';
import 'package:invesier/features/presentation/home/home_page/widget/post_card_widget.dart';

class PioneersEnumWidget extends StatelessWidget {
  const PioneersEnumWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        // PostCardWidget
        return PostCardWidget(
          imageOnTap: () {
            // UserProfileRoute
            context.router.push(UserProfileRoute());
          },
          commentOnTap: () {
            // CommentRoute
            context.router.push(CommentRoute());
          },
        );
      },
    );
  }
}
