import 'package:dio/dio.dart';
import 'package:invesier/core/constant/endpoints.dart';

class StoreTheFcmTokenForTheAuthenticatedUserService {
  final Dio dio;

  StoreTheFcmTokenForTheAuthenticatedUserService({required this.dio});

  Future<void> storeTheFcmTokenForTheAuthenticatedUser({
    required String token,
    String? deviceType,
  }) async {
    await dio.post(
      Endpoints.kFcmRegister,
      data: {"token": token, if (deviceType != null) "device_type": deviceType},
    );
  }
}
