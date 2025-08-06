import 'package:dio/dio.dart';

import '../../../core/constant/app_strings.dart';
import '../../../core/constant/endpoints.dart';

class ResendOtpService {
  final Dio dio;

  ResendOtpService({required this.dio});
  Future<void> resendOtp({
    required String authMethod,
    String? phonePrefix,
    String? email,
    String? phone,
  }) async {
    await dio.post(
      Endpoints.kResendOtp,
      data: {
        AppStrings.authMethod: authMethod,
        if (phonePrefix != null) AppStrings.phonePrefix: phonePrefix,
        if (email != null) AppStrings.email: email,
        if (phone != null) AppStrings.phone: phone,
      },
    );
  }
}
