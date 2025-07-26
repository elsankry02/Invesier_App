import 'package:dio/dio.dart';
import 'package:invesier/core/constant/endpoints.dart';

class VerifyOtpService {
  final Dio dio;
  VerifyOtpService({required this.dio});
  Future<void> verifyOtp({
    required String authMethod,
    String? otp,
    String? email,
    String? phone,
    String? phonePrefix,
  }) async {
    await dio.post(
      Endpoints.kVerifyOtp,
      data: {
        "auth_method": authMethod,
        if (phonePrefix != null) "otp": otp,
        if (phonePrefix != null) "phone_prefix": phonePrefix,
        if (email != null) "email": email,
        if (phone != null) "phone": phone,
      },
    );
  }
}
