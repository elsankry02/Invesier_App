import 'package:dio/dio.dart';
import 'package:invesier/core/constant/endpoints.dart';
import 'package:invesier/features/model/user_model.dart';

class GetAuthenticatedUserService {
  final Dio dio;

  GetAuthenticatedUserService({required this.dio});
  Future<UserModel> getUser() async {
    final response = await dio.get(Endpoints.kUser);
    final data = response.data as Map<String, dynamic>;
    return UserModel.fromJson(data);
  }
}
