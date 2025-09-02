import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constant/app_enums.dart';
import 'provider.dart';

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

  Future<void> getString() async {
    final prefs = ref.read(prefsProvider);
    final code = prefs.getString('app_locale') ?? 'en';
    state = LocalizationSuccess(locale: Locale(code));
  }

  Future<void> setString(Language language) async {
    final prefs = ref.read(prefsProvider);
    await prefs.setString('app_locale', language.code);
    state = LocalizationSuccess(locale: Locale(language.code));
  }
}

final localizationProvider =
    NotifierProvider<LocalizationNotifier, LocalizationState>(() {
      return LocalizationNotifier();
    });
