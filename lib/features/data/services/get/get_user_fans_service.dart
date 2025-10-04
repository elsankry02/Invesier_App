import 'package:dio/dio.dart';

import '../../models/get/get_user_fans_model.dart';

class GetUserFansService {
  final Dio dio;

  GetUserFansService({required this.dio});
  Future<List<GetUserFansModel>> getUserFans({
    required String username,
    String? search,
  }) async {
    final response = await dio.get(
      "/social/profiles/${username}/fans",
      queryParameters: {if (search != null) "search": search},
    );
    final data = response.data as Map<String, dynamic>;
    final result = data["data"] as List<dynamic>;
    return result
        .map((e) => GetUserFansModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
