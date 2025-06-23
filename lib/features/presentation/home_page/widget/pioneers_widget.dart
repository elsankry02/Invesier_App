import 'package:flutter/material.dart';
import 'package:invesier/features/presentation/home_page/widget/custom_post_card_widget.dart';

class PioneersWidget extends StatelessWidget {
  const PioneersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsetsDirectional.only(bottom: 10),
          child: CustomPostCardWidget(),
        );
      },
    );
  }
}
