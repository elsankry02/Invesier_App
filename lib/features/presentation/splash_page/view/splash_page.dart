import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constant/color_manger.dart';
import '../../../../core/constant/image_manger.dart';
import '../../../../core/constant/strings.dart';
import '../../../../core/extension/extension.dart';
import '../../../../core/router/router.dart';
import '../../../provider/provider.dart';

@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    splashFunc();
    super.initState();
  }

  splashFunc() {
    Future.delayed(Duration(seconds: 3), () {
      final isSaved =
          ref.read(prefsProvider).getBool(CustomStrings.skipOnboarding) ??
          false;
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
      backgroundColor: ColorManger.kBackGround,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              ImageManger.kLogo,
              width: context.width * 0.6,
              height: context.height * 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
