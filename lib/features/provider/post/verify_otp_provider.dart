import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/features/provider/provider.dart';

class VerifyOtpState {}

class VerifyOtpInitial extends VerifyOtpState {}

class VerifyOtpSuccess extends VerifyOtpState {}

class VerifyOtpLoading extends VerifyOtpState {}

class VerifyOtpFailuer extends VerifyOtpState {
  final String errMassege;

  VerifyOtpFailuer({required this.errMassege});
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
      provider.verifyOtp(
        authMethod: authMethod,
        otp: otp,
        email: email,
        phone: phone,
        phonePrefix: phonePrefix,
      );
    } on Exception catch (e) {
      state = VerifyOtpFailuer(errMassege: e.toString());
    }
  }
}

final verifyOtpProvider = NotifierProvider<VerifyOtpNotifier, VerifyOtpState>(
  VerifyOtpNotifier.new,
);
