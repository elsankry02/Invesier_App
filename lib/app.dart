import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/constant/app_colors.dart';
import 'core/constant/app_strings.dart';
import 'core/router/router.dart';
import 'features/data/provider/localization_provider.dart';
import 'l10n/app_localizations.dart';

class InvesierApp extends ConsumerStatefulWidget {
  const InvesierApp({super.key});

  @override
  ConsumerState<InvesierApp> createState() => _InvesierAppState();
}

class _InvesierAppState extends ConsumerState<InvesierApp> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(localizationProvider);
    if (state is LocalizationSuccess) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router.config(),
        locale: Locale(state.selectLang),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          brightness: Brightness.dark,
          textTheme: textTheme(),
          fontFamily: AppStrings.manrope,
        ),
      );
    }
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router.config(),
      locale: Locale("en"),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: textTheme(),
        fontFamily: AppStrings.manrope,
      ),
    );
  }

  TextTheme textTheme() {
    final kWhite = TextStyle(color: AppColors.kWhite);
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
