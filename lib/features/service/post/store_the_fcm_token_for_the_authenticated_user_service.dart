import 'package:dio/dio.dart';
import '../../../core/constant/app_strings.dart';

import '../../../core/constant/endpoints.dart';

class StoreTheFcmTokenForTheAuthenticatedUserService {
  final Dio dio;

  StoreTheFcmTokenForTheAuthenticatedUserService({required this.dio});

  Future<void> storeTheFcmTokenForTheAuthenticatedUser({
    required String token,
    String? deviceType,
  }) async {
    await dio.post(
      Endpoints.kFcmRegister,
      data: {
        AppStrings.token: token,
        if (deviceType != null) AppStrings.devicetype: deviceType,
      },
    );
  }
}
