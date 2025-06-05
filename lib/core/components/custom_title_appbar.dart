import 'package:flutter/material.dart';
import '../extension/extension.dart';

class CustomTitelAppBar extends StatelessWidget {
  const CustomTitelAppBar({super.key, required this.title});

  final String title;

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
