import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      await provider.verifyOtp(
        authMethod: authMethod,
        otp: otp,
        email: email,
        phone: phone,
        phonePrefix: phonePrefix,
      );
      state = VerifyOtpSuccess();
    } on Exception catch (e) {
      state = VerifyOtpFailure(errMessage: e.toString());
    }
  }
}

final verifyOtpProvider = NotifierProvider<VerifyOtpNotifier, VerifyOtpState>(
  VerifyOtpNotifier.new,
);
