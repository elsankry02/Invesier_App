import 'package:dio/dio.dart';
import 'package:invesier/core/endpoints/endpoints.dart';

class VerifyOtpService {
  final Dio dio;
  VerifyOtpService({required this.dio});
  Future<void> verifyOtp({
    required String authMethod,
    required String otp,
    String? email,
    String? phone,
    String? phonePrefix,
  }) async {
    dio.post(
      Endpoints.kVerifyOtp,
      data: {
        "auth_method": authMethod,
        "otp": otp,
        if (phonePrefix != null) "phone_prefix": phonePrefix,
        if (email != null) "email": email,
        if (phone != null) "phone": phone,
      },
    );
  }
}
