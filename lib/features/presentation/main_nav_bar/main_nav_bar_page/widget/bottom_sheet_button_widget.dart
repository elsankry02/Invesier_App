import 'package:flutter/material.dart';

import '../../../../../core/extension/extension.dart';

class BottomSheetButtonWidget extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const BottomSheetButtonWidget({super.key, required this.title, this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: context.height * 0.010),
        width: context.width,
        decoration: BoxDecoration(),
        child: Row(
          spacing: 10,
          children: [
            Text(
              // title
              title,
              style: context.kTextTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
