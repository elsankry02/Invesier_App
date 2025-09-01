import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/constant/app_colors.dart';
import 'core/constant/app_strings.dart';
import 'core/router/router.dart';
import 'features/provider/localization_provider.dart';
import 'l10n/app_localizations.dart';

class InvesierApp extends ConsumerWidget {
  const InvesierApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizationState = ref.watch(localizationProvider);

    Locale currentLocale = const Locale('ar');

    if (localizationState is LocalizationSuccess) {
      currentLocale = localizationState.locale;
    }
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router.config(),
      locale: currentLocale,
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
