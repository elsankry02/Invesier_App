import 'package:flutter/material.dart';
import '../../../../../core/components/custom_no_posts_widget.dart';

class PioneersWidget extends StatelessWidget {
  const PioneersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: const [CustomNoPostsWidget()],
    );
  }
}
