import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constant/app_enums.dart'; // فيه enum Language
import 'provider.dart'; // فيه prefsProvider

// ------------------ States ------------------
abstract class LocalizationState {}

class LocalizationInitial extends LocalizationState {}

class LocalizationSuccess extends LocalizationState {
  final Locale locale;
  LocalizationSuccess({required this.locale});
}

class LocalizationNotifier extends Notifier<LocalizationState> {
  @override
  LocalizationState build() {
    return LocalizationInitial();
  }

  Future<void> loadLocale() async {
    final prefs = ref.read(prefsProvider);
    final code = prefs.getString('app_locale') ?? 'en';
    state = LocalizationSuccess(locale: Locale(code));
  }

  Future<void> changeLocale(Language language) async {
    final prefs = ref.read(prefsProvider);
    await prefs.setString('app_locale', language.code);
    state = LocalizationSuccess(locale: Locale(language.code));
  }
}

final localizationProvider =
    NotifierProvider<LocalizationNotifier, LocalizationState>(() {
      return LocalizationNotifier();
    });
