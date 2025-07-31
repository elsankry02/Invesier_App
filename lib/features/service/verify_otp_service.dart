import 'package:dio/dio.dart';
import 'package:invesier/features/model/login_model.dart';

import '../../core/constant/endpoints.dart';

class VerifyOtpService {
  final Dio dio;
  VerifyOtpService({required this.dio});
  Future<LoginModel> verifyOtp({
    required String authMethod,
    required String otp,
    String? email,
    String? phone,
    String? phonePrefix,
  }) async {
    final response = await dio.post(
      Endpoints.kVerifyOtp,
      data: {
        "auth_method": authMethod,
        "otp": otp,
        if (phonePrefix != null) "phone_prefix": phonePrefix,
        if (email != null) "email": email,
        if (phone != null) "phone": phone,
      },
    );
    final userData = response.data as Map<String, dynamic>;
    return LoginModel.fromJson(userData);
  }
}
