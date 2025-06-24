import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/router/router.dart';
import 'package:invesier/features/presentation/home_page/widget/post_card_widget.dart';

class ForYouWidget extends StatelessWidget {
  const ForYouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 10),
          //! PostCardWidget
          child: PostCardWidget(
            onTap: () {
              context.router.push(CommentRoute());
            },
          ),
        );
      },
    );
  }
}
