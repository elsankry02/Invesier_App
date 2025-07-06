import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invesier/core/constant/color_manger.dart';
import 'package:invesier/core/extension/extension.dart';
import 'package:invesier/features/presentation/home/notification_page/widget/notification_appbar_widget.dart';
import 'package:invesier/features/presentation/home/notification_page/widget/notification_started_following_you_widget.dart';
import 'package:invesier/features/presentation/home/notification_page/widget/notification_upvoted_your_post_widget.dart';

@RoutePage()
class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorManger.k1, ColorManger.k2],
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
                      // Notification AppBar
                      NotificationAppBarWidget(),
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
