import 'package:dio/dio.dart';
import 'package:invesier/core/endpoients/endpoients.dart';

class ResendOtpServices {
  final Dio dio;

  ResendOtpServices({required this.dio});
  Future<void> resendOtp({
    required String authMethod,
    required String phonePrefix,
    required String email,
    required String phone,
  }) async {
    await dio.post(
      Endpoients.kResendOtp,
      data: {
        "auth_method": authMethod,
        "phone_prefix": phonePrefix,
        "email": email,
        "phone": phone,
      },
    );
  }
}
