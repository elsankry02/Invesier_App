import 'package:flutter/material.dart';

import '../../../../core/extension/extension.dart';

class ButtonSheetTextWidget extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const ButtonSheetTextWidget({super.key, required this.title, this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap
      onTap: onTap,
      child: Text(
        // title
        title,
        style: context.kTextTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
