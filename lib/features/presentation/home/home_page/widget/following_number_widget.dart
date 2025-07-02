import 'package:flutter/material.dart';
import 'package:invesier/core/extension/extension.dart';

class FollowingNumberWidget extends StatelessWidget {
  const FollowingNumberWidget({
    super.key,
    required this.title,
    required this.number,
  });
  final String title;
  final String number;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          textAlign: TextAlign.center,
          number,
          style: context.kTextTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          title,
          style: context.kTextTheme.labelMedium!.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
