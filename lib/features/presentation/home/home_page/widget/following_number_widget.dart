import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';

class FollowingNumberWidget extends StatelessWidget {
  final String title;
  final int number;
  final Function()? onTap;
  const FollowingNumberWidget({
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
            textAlign: TextAlign.center,
            "$number",
            style: context.kTextTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          // title
          Text(
            title,
            style: context.kTextTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
