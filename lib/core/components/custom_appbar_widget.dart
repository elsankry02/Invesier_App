import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/data/providers/get/get_posts_provider.dart';

import '../constant/app_colors.dart';
import '../extension/extension.dart';
import 'custom_icon_button.dart';

class CustomAppBarWidget extends ConsumerWidget {
  final String title;
  const CustomAppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        // title
        Text(
          textAlign: TextAlign.center,
          title,
          style: context.kTextTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        // icon
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: CustomIconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.kWhite,
            ),
            onPressed: () {
              context.router.maybePop();
              ref.read(getPostsProvider.notifier).getPosts();
            },
          ),
        ),
      ],
    );
  }
}
