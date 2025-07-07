import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constant/svg_manger.dart';
import '../../../../../core/router/router.dart';
import '../../user_profile_page/widget/user_pop_menu_widget.dart';
import 'foryou_dialog_widget.dart';
import 'post_card_widget.dart';

class ForYouWidget extends StatelessWidget {
  const ForYouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return PostCardWidget(
          // list tile trailing
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
            icon: SvgManger.kPin,
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
