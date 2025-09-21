import 'package:dio/dio.dart';

import '../../models/get/get_user_pioneers_model.dart';

class GetUserPioneersService {
  final Dio dio;

  GetUserPioneersService({required this.dio});

  Future<List<GetUserPioneersModel>> getUserPioneers({
    String? search,
    String? userName,
  }) async {
    final response = await dio.get(
      "/social/profiles/$userName/pioneers?search=$search",
      queryParameters: {
        if (userName != null) "username": userName,
        if (search != null) "search": search,
      },
    );
    final data = response.data as List<dynamic>;
    return data.map((e) => GetUserPioneersModel.fromJson(e)).toList();
  }
}
