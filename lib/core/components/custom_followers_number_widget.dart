import 'package:flutter/material.dart';

import '../extension/extension.dart';

class CustomFollowersNumberWidget extends StatelessWidget {
  final String title;
  final int number;
  final Function()? onTap;
  const CustomFollowersNumberWidget({
    super.key,
    required this.title,
    required this.number,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap
      onTap: onTap,
      child: Column(
        children: [
          // number
          Text(
            "$number",
            textAlign: TextAlign.center,
            style: context.kTextTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          // title
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.kTextTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
