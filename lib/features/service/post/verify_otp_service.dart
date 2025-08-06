import 'package:dio/dio.dart';
import '../../../core/constant/app_strings.dart';

import '../../../core/constant/endpoints.dart';
import '../../model/login_model.dart';

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
        AppStrings.authMethod: authMethod,
        AppStrings.otp: otp,
        if (phonePrefix != null) AppStrings.phonePrefix: phonePrefix,
        if (email != null) AppStrings.email: email,
        if (phone != null) AppStrings.phone: phone,
      },
    );
    final loginModel = response.data as Map<String, dynamic>;
    return LoginModel.fromJson(loginModel);
  }
}
