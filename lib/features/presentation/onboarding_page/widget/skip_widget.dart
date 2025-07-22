import 'package:flutter/material.dart';

import '../../../../core/extension/extension.dart';

class SkipWidget extends StatelessWidget {
  final void Function()? onTap;
  final String skip;
  const SkipWidget({super.key, required this.onTap, required this.skip});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          // onTap
          onTap: onTap,
          // skip
          child: Text(
            skip,
            style: context.kTextTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
