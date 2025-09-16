import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constant/app_strings.dart';
import '../provider.dart';

abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutFaliure extends LogoutState {
  final String errMessage;

  LogoutFaliure({required this.errMessage});
}

class LogoutSuccess extends LogoutState {}

class LogoutNotifier extends Notifier<LogoutState> {
  @override
  LogoutState build() {
    return LogoutInitial();
  }

  Future<void> logout() async {
    final provider = ref.read(logoutServiceProvider);
    state = LogoutLoading();
    try {
      await provider.logout();
      state = LogoutSuccess();
    } on Exception catch (e) {
      if (e is DioException) {
        final data = e.response!.data;
        state = LogoutFaliure(errMessage: data[AppStrings.message]);
      }
    }
  }
}

final logoutProvider = NotifierProvider<LogoutNotifier, LogoutState>(
  LogoutNotifier.new,
);
