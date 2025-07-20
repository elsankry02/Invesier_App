import 'package:dio/dio.dart';
import 'package:invesier/core/endpoients/endpoients.dart';

class RegisterService {
  final Dio dio;
  RegisterService({required this.dio});
  Future<void> register({
    required String authMethod,
    String? phonePrefix,
    String? email,
    String? phone,
    String? prefix,
  }) async {
    await dio.post(
      Endpoients.kRegister,
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
