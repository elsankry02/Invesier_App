import 'package:flutter/material.dart';
import 'package:invesier/core/extension/extension.dart';

class ChaseOrPostsContainerWidget extends StatelessWidget {
  const ChaseOrPostsContainerWidget({
    super.key,
    required this.title,
    this.backGroundColor,
  });
  final String title;
  final Color? backGroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(31),
      ),
      //! title
      child: Text(
        textAlign: TextAlign.center,
        title,
        style: context.kTextTheme.titleSmall!.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
