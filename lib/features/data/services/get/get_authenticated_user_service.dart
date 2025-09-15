import 'package:dio/dio.dart';

import '../../../../core/constant/endpoints.dart';
import '../../models/user_model.dart';

class GetAuthenticatedUserService {
  final Dio dio;

  GetAuthenticatedUserService({required this.dio});
  Future<UserModel> getUser() async {
    final response = await dio.get(Endpoints.kUser);
    final userData = response.data as Map<String, dynamic>;
    return UserModel.fromJson(userData);
  }
}
