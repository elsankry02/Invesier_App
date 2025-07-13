import 'package:flutter/material.dart';

import 'core/constant/color_manger.dart';
import 'core/constant/string_manger.dart';
import 'core/router/router.dart';

class Invesier extends StatelessWidget {
  const Invesier({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router.config(),
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: textTheme(),
        fontFamily: StringManger.kManrope,
      ),
    );
  }

  TextTheme textTheme() {
    final kWhite = TextStyle(color: ColorManger.kWhite);
    return TextTheme(
      displayLarge: kWhite,
      displayMedium: kWhite,
      displaySmall: kWhite,
      headlineLarge: kWhite,
      headlineMedium: kWhite,
      headlineSmall: kWhite,
      bodyLarge: kWhite,
      bodyMedium: kWhite,
      bodySmall: kWhite,
      titleLarge: kWhite,
      titleMedium: kWhite,
      titleSmall: kWhite,
      labelLarge: kWhite,
      labelMedium: kWhite,
      labelSmall: kWhite,
    );
  }
}
