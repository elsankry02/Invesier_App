import 'package:dio/dio.dart';

import '../../../core/constant/endpoints.dart';

class LogoutService {
  final Dio dio;

  LogoutService({required this.dio});
  Future<void> logout() async {
    await dio.post(Endpoints.kLogout);
  }
}
