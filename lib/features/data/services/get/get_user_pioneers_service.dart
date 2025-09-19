import 'dart:developer';

import 'package:dio/dio.dart';
import '../../models/get/get_user_pioneers_model.dart';

class GetUserPioneersService {
  final Dio dio;

  GetUserPioneersService({required this.dio});

  Future<List<GetUserPioneersModel>> getUserPioneers({
    String? search,
    required String username,
  }) async {
    final response = await dio.get(
      "/social/profiles/${username}/pioneers",
      queryParameters: {if (search != null) "search": search},
    );
    final data = response.data as List<dynamic>;
    log(data.toString());
    return data
        .map((e) => GetUserPioneersModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
