import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/components/show_custom_top_snack_bar.dart';

import '../../../../../core/components/coustom_pop_menu_widget.dart';
import '../../../../../core/router/router.dart';
import '../../home_page/widget/post_card_widget.dart';

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
          trailing: CustomPopMenuWidget(
            firstTitle: "Pin post",
            secondTitle: "Delete post",
            onFirstTap:
                () => showCustomErrorMessage(context, message: "Pin action"),
            onSecondTap:
                () => showCustomErrorMessage(context, message: "Delete action"),
          ),
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
