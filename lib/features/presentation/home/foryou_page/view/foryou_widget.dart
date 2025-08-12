import 'package:flutter/material.dart';
import 'package:invesier/core/components/custom_no_posts_widget.dart';

class ForYouWidget extends StatelessWidget {
  const ForYouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [CustomNoPostsWidget()],
    );
  }
}
