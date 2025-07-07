import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/router/router.dart';
import 'pop_menu_button_widget.dart';
import 'post_card_widget.dart';

class PioneersWidget extends StatelessWidget {
  const PioneersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        // PostCardWidget
        return PostCardWidget(
          // trailing
          trailing: PopMenuButtonWidget(),
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
