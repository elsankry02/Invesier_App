import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UserPioneersWidget extends StatelessWidget {
  const UserPioneersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Lottie.asset(
            'assets/lottie/coming_soon.json',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
