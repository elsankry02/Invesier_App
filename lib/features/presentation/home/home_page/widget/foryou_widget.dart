import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/constant/svg_manger.dart';
import 'package:invesier/core/router/router.dart';
import 'package:invesier/features/presentation/home/home_page/widget/foryou_dialog_widget.dart';
import 'package:invesier/features/presentation/home/home_page/widget/post_card_widget.dart';
import 'package:invesier/features/presentation/home/user_profile_page/widget/user_pop_menu_widget.dart';

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
