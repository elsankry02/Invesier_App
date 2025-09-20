import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../../core/components/coustom_pop_menu_widget.dart';
import '../../../../../core/components/custom_post_widget.dart';
import '../../../../../core/constant/app_images.dart';
import '../../../../../core/constant/app_svgs.dart';
import '../../../../../core/router/router.dart';

class PioneersPage extends StatelessWidget {
  const PioneersPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final local = context.kAppLocalizations;
    return CustomPostWidget(
      name: 'Mohamed Ibrahim',
      userName: '@elsankry02',
      postTitle:
          'Today I learned something new in Flutter and it feels amazing to keep growing step by step',
      avatarUrl: AppImages.kBoyFour,
      imagePost: AppImages.kBoyOne,
      upvotesCount: 2311,
      downvotesCount: 1,
      commentsCount: 546,
      trailing: CustomPopMenuWidget(
        firstTitle: "Pin Post",
        secondTitle: "Delete",
        firstSvg: AppSvgs.kPin,
        secondSvg: AppSvgs.kDelete,
      ),

      commentOnTap: () => context.router.push(CommentRoute()),
    );
  }
}
