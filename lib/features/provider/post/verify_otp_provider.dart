import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constant/app_strings.dart';
import '../provider.dart';

class VerifyOtpState {}

class VerifyOtpInitial extends VerifyOtpState {}

class VerifyOtpSuccess extends VerifyOtpState {}

class VerifyOtpLoading extends VerifyOtpState {}

class VerifyOtpFailure extends VerifyOtpState {
  final String errMessage;

  VerifyOtpFailure({required this.errMessage});
}

class VerifyOtpNotifier extends Notifier<VerifyOtpState> {
  @override
  VerifyOtpState build() {
    return VerifyOtpInitial();
  }

  Future<void> verifyOtp({
    required String authMethod,
    required String otp,
    String? email,
    String? phone,
    String? phonePrefix,
  }) async {
    final provider = ref.read(verifyOtpServiceProvider);
    try {
      state = VerifyOtpLoading();
      final authResponse = await provider.verifyOtp(
        authMethod: authMethod,
        otp: otp,
        email: email,
        phone: phone,
        phonePrefix: phonePrefix,
      );
      final token = authResponse.token;
      await ref.read(prefsProvider).setString(AppStrings.userToken, token);
      ref.invalidate(dioProvider);
      state = VerifyOtpSuccess();
    } on Exception catch (e) {
      if (e is DioException) {
        final data = e.response!.data;
        state = VerifyOtpFailure(errMessage: data[AppStrings.message]);
      }
    }
  }
}

final verifyOtpProvider = NotifierProvider<VerifyOtpNotifier, VerifyOtpState>(
  VerifyOtpNotifier.new,
);
