import 'package:flutter/material.dart';

import '../../../../../core/components/custom_no_posts_widget.dart';
import '../../../../../core/extension/extension.dart';

class ForYouWidget extends StatelessWidget {
  const ForYouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final local = context.kAppLocalizations;
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [CustomNoPostsWidget(title: local.nopoststodisplay)],
    );
  }
}
