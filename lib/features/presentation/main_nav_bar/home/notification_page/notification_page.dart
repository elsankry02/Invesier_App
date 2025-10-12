import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/custom_appbar_widget.dart';
import '../../../../../core/components/custom_no_posts_widget.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/extension/extension.dart';

@RoutePage()
class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.kOne, AppColors.kTwo],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.height * 0.020),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: context.height * 0.025),
                      // Notification AppBar
                      CustomAppBarWidget(
                        title: local.notification,
                        onPressed: () => context.router.maybePop(),
                      ),
                      SizedBox(height: context.height * 0.025),
                      CustomNoPostsWidget(title: local.nonotificationsyet),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
