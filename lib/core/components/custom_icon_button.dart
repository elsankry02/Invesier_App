import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, required this.icon});
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.router.maybePop();
      },
      icon: icon,
    );
  }
}
