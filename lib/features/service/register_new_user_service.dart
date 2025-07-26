import 'package:dio/dio.dart';
import 'package:invesier/core/constant/endpoints.dart';

class RegisterNewUserService {
  final Dio dio;
  RegisterNewUserService({required this.dio});
  Future<void> registerNewUser({
    required String authMethod,
    String? phonePrefix,
    String? email,
    String? phone,
    String? prefix,
  }) async {
    await dio.post(
      Endpoints.kRegister,
      data: {
        "auth_method": authMethod,
        if (phonePrefix != null) "phone_prefix": phonePrefix,
        if (email != null) "email": email,
        if (phone != null) "phone": phone,
        if (prefix != null) "prefix": prefix,
      },
    );
  }
}
