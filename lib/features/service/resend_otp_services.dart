import 'package:dio/dio.dart';
import 'package:invesier/core/endpoients/endpoients.dart';

class ResendOtpServices {
  final Dio dio;

  ResendOtpServices({required this.dio});
  Future<void> resendOtp({
    required String authMethod,
    String? phonePrefix,
    String? email,
    String? phone,
  }) async {
    await dio.post(
      Endpoients.kResendOtp,
      data: {
        "auth_method": authMethod,
        if (phonePrefix != null) "phone_prefix": phonePrefix,
        if (email != null) "email": email,
        if (phone != null) "phone": phone,
      },
    );
  }
}
