import 'package:dio/dio.dart';

import '../../../../core/constant/app_strings.dart';
import '../../../../core/constant/endpoints.dart';

class RegisterNewUserService {
  final Dio dio;
  RegisterNewUserService({required this.dio});
  Future<void> registerNewUser({
    required String authMethod,
    String? prefix,
    String? phonePrefix,
    String? email,
    String? phone,
  }) async {
    await dio.post(
      Endpoints.kRegister,
      data: {
        AppStrings.authMethod: authMethod,
        if (phonePrefix != null) AppStrings.phonePrefix: phonePrefix,
        if (email != null) AppStrings.email: email,
        if (phone != null) AppStrings.phone: phone,
        if (prefix != null) AppStrings.prefix: prefix,
      },
    );
  }
}
