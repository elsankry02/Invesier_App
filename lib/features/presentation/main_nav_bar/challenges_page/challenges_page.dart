import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class ChallengesPage extends StatelessWidget {
  const ChallengesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Lottie
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
