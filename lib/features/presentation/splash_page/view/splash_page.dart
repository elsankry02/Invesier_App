import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_images.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/router/router.dart';
import '../../../provider/provider.dart';

@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

// "28|wrq1eF9zkN65GisrSYCGFeWWq9EiUfXP8lIvPmmIcdc49ceb"
class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    splash();
    super.initState();
  }

  Future<void> splash() async {
    await Future.delayed(Duration(seconds: 3), () {
      final provider = ref.read(prefsProvider);
      final isSaved = provider.getBool(AppStrings.skipOnboarding) ?? false;
      final token = provider.getString(AppStrings.kToken);

      if (token != null) {
        context.router.replace(BottomNavigationBarRoute());
        return;
      }

      if (isSaved) {
        context.router.replace(WelcomeRoute());
      } else {
        context.router.replace(OnboardingRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackGround,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AppImages.kLogo,
              width: context.width * 0.6,
              height: context.height * 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
