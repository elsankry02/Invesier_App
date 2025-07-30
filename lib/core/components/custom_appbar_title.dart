import 'package:flutter/material.dart';

import '../extension/extension.dart';

class CustomAppBarTitle extends StatelessWidget {
  final String title;
  const CustomAppBarTitle({super.key, required this.title});
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
