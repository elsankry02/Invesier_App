import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constant/app_colors.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.kOne, AppColors.kTwo],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset(
                'assets/lottie/coming_soon.json',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
