import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constant/app_svgs.dart';
import '../../../../../core/router/router.dart';
import '../../home_page/widget/post_card_widget.dart';
import '../../user_profile_page/widget/user_pop_menu_widget.dart';
import '../widget/foryou_dialog_widget.dart';

class ForYouWidget extends StatelessWidget {
  const ForYouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (context, index) {
        return PostCardWidget(
          trailing: UserPopMenuWidget(
            onTap: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return ForYouDialogWidget();
                },
              );
            },
            icon: AppSvgs.kblockVictor,
            title: 'Report post',
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
