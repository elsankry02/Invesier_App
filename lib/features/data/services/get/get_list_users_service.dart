import 'package:dio/dio.dart';
import 'package:invesier/features/data/models/get/get_list_users_model.dart';

class GetListUsersService {
  final Dio dio;

  GetListUsersService({required this.dio});
  Future<List<Datum>> getListUsers({
    String? userName,
    int? perPage = 10,
  }) async {
    final response = await dio.get(
      "/social/profiles?search=$userName&per_page=$perPage",
      queryParameters: {
        if (userName != null) "search": userName,
        if (perPage != null) "per_page": perPage,
      },
    );
    final data = response.data as Map<String, dynamic>;
    final getlistUsers = data["data"] as List<dynamic>;
    return getlistUsers.map((e) => Datum.fromJson(e)).toList();
  }
}
