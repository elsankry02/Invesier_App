import 'package:flutter/material.dart';

import '../extension/extension.dart';

class CustomInkwelButtonWidget extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final IconData? icon;
  const CustomInkwelButtonWidget({
    super.key,
    required this.title,
    this.onTap,
    this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: context.width,
        decoration: BoxDecoration(),
        child: Row(
          spacing: 10,
          children: [
            Icon(icon),

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
