import 'package:flutter/material.dart';

import '../extension/extension.dart';

class CustomTitelAppBar extends StatelessWidget {
  final String title;
  const CustomTitelAppBar({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      title,
      style: context.kTextTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
