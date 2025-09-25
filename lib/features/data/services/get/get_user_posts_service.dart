import 'package:dio/dio.dart';
import '../../models/get/get_user_posts_model;.dart';

class GetUserPostsService {
  final Dio dio;

  GetUserPostsService({required this.dio});
  Future<List<GetUserPostsModel>> getUserPosts({
    required String username,
  }) async {
    final response = await dio.get("/social/profiles/${username}/posts");
    final data = response.data as Map<String, dynamic>;
    final result = data["data"] as List<dynamic>;
    return result
        .map((e) => GetUserPostsModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
