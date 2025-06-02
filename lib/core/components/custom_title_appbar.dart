import 'package:flutter/material.dart';

class CustomTitelAppBar extends StatelessWidget {
  const CustomTitelAppBar({
    super.key,
    required this.kTextTheme,
    required this.title,
  });

  final TextTheme kTextTheme;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      title,
      style: kTextTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w700),
    );
  }
}
