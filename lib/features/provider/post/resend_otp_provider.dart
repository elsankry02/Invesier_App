import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider.dart';

abstract class ResendOtpState {}

class ResendOtpInitial extends ResendOtpState {}

class ResendOtpSuccess extends ResendOtpState {}

class ResendOtpFailure extends ResendOtpState {
  final String errMessage;

  ResendOtpFailure({required this.errMessage});
}

class ResendOtpLoading extends ResendOtpState {}

class ResendOtpNotifier extends Notifier<ResendOtpState> {
  @override
  ResendOtpState build() {
    return ResendOtpInitial();
  }

  Future<void> resendOtp({
    required String authMethod,
    String? phonePrefix,
    String? email,
    String? phone,
  }) async {
    final provider = ref.read(resendOtpServiceProvider);
    try {
      state = ResendOtpLoading();
      await provider.resendOtp(
        authMethod: authMethod,
        phonePrefix: phonePrefix,
        email: email,
        phone: phone,
      );
      state = ResendOtpSuccess();
    } on Exception catch (e) {
      state = ResendOtpFailure(errMessage: e.toString());
    }
  }
}

final resendOtpProvider = NotifierProvider<ResendOtpNotifier, ResendOtpState>(
  () {
    return ResendOtpNotifier();
  },
);
