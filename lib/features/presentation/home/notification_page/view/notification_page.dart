import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../core/components/custom_appbar_widget.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/extension/extension.dart';
import '../widget/notification_started_following_you_widget.dart';
import '../widget/notification_upvoted_your_post_widget.dart';

@RoutePage()
class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: context.height * 0.025),
                      // Notification AppBar
                      CustomAppBarWidget(title: 'Notification'),
                      SizedBox(height: context.height * 0.016),
                      // Notification Started Following You
                      NotificationStartedFollowingYouWidget(),
                      SizedBox(height: context.height * 0.006),
                      // Notification Upvoted Your Post Widget
                      NotificationUpvotedYourPostWidget(),
                      SizedBox(height: context.height * 0.006),
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
