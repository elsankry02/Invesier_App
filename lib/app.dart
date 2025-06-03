import 'package:flutter/material.dart';

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
    final kColorWhite = TextStyle(color: Colors.white);
    return TextTheme(
      displayLarge: kColorWhite,
      displayMedium: kColorWhite,
      displaySmall: kColorWhite,
      headlineLarge: kColorWhite,
      headlineMedium: kColorWhite,
      headlineSmall: kColorWhite,
      bodyLarge: kColorWhite,
      bodyMedium: kColorWhite,
      bodySmall: kColorWhite,
      titleLarge: kColorWhite,
      titleMedium: kColorWhite,
      titleSmall: kColorWhite,
      labelLarge: kColorWhite,
      labelMedium: kColorWhite,
      labelSmall: kColorWhite,
    );
  }
}
