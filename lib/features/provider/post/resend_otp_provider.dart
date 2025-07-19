import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/features/provider/provider.dart';

abstract class ResendOtpState {}

class ResendOtpInitial extends ResendOtpState {}

class ResendOtpSuccess extends ResendOtpState {}

class ResendOtpFailuer extends ResendOtpState {
  final String errMassege;

  ResendOtpFailuer({required this.errMassege});
}

class ResendOtpLoading extends ResendOtpState {}

class ResendOtpNotifier extends Notifier<ResendOtpState> {
  @override
  ResendOtpState build() {
    return ResendOtpInitial();
  }

  Future<void> resendOtp({
    required String authMethod,
    String phonePrefix = '',
    String email = '',
    String phone = '',
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
      ResendOtpFailuer(errMassege: e.toString());
    }
  }
}

final resendOtpProvider = NotifierProvider<ResendOtpNotifier, ResendOtpState>(
  () {
    return ResendOtpNotifier();
  },
);
