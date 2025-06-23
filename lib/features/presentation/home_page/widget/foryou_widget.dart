import 'package:flutter/material.dart';
import 'package:invesier/features/presentation/home_page/widget/custom_post_card_widget.dart';

class ForYouWidget extends StatelessWidget {
  const ForYouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 10),
          child: CustomPostCardWidget(),
        );
      },
    );
  }
}
