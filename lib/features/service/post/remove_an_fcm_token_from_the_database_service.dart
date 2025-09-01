import 'package:dio/dio.dart';

import '../../../core/constant/app_strings.dart';
import '../../../core/constant/endpoints.dart';

class RemoveAnFcmTokenFromTheDatabaseService {
  final Dio dio;

  RemoveAnFcmTokenFromTheDatabaseService({required this.dio});
  Future<void> removeAnFcmTokenFromTheDatabase({required String token}) async {
    await dio.post(Endpoints.kUnregister, data: {AppStrings.token: token});
  }
}
