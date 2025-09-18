import 'package:dio/dio.dart';

import '../../../../core/constant/endpoints.dart';
import '../../models/get/get_posts_model.dart';

class GetPostsService {
  final Dio dio;

  GetPostsService({required this.dio});
  Future<List<Datum>> getPosts({int perPage = 16}) async {
    final response = await dio.get(
      Endpoints.kGetPosts,
      queryParameters: {"per_page": perPage},
    );
    final data = response.data as Map<String, dynamic>;
    final result = data["data"] as List<dynamic>;
    return result.map((e) => Datum.fromJson(e)).toList();
  }
}
