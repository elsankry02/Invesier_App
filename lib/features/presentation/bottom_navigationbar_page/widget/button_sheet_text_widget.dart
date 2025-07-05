import 'package:flutter/material.dart';
import '../../../../core/extension/extension.dart';

class ButtonSheetTextWidget extends StatelessWidget {
  const ButtonSheetTextWidget({super.key, required this.title, this.onTap});
  final String title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        title,
        style: context.kTextTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
