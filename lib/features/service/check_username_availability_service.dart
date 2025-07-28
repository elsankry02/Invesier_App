import 'package:dio/dio.dart';

import '../../core/constant/endpoints.dart';

class CheckUserNameAvailabilityService {
  final Dio dio;

  CheckUserNameAvailabilityService({required this.dio});
  Future<void> checkUsernameAvailability({required String username}) async {
    await dio.post(Endpoints.kUserNameAvailable, data: {"username": username});
  }
}
