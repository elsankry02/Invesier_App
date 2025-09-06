import 'package:dio/dio.dart';

import '../../../core/constant/endpoints.dart';
import '../../model/get_posts_model.dart';

class GetPostsService {
  final Dio dio;

  GetPostsService({required this.dio});
  Future<List<GetPostsModel>> getPosts({int perPage = 16}) async {
    final response = await dio.get(
      Endpoints.kGetPosts,
      queryParameters: {"per_page": perPage},
    );
    final data = response.data["data"] as List<dynamic>;
    return data.map((e) => GetPostsModel.fromJson(e)).toList();
  }
}
