import 'package:dio/dio.dart';

import '../../../core/constant/endpoints.dart';

class RegisterNewUserService {
  final Dio dio;
  RegisterNewUserService({required this.dio});
  Future<void> registerNewUser({
    required String authMethod,
    required String prefix,
    String? phonePrefix,
    String? email,
    String? phone,
  }) async {
    await dio.post(
      Endpoints.kRegister,
      data: {
        "auth_method": authMethod,
        if (phonePrefix != null) "phone_prefix": phonePrefix,
        if (email != null) "email": email,
        if (phone != null) "phone": phone,
        "prefix": prefix,
      },
    );
  }
}
