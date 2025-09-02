import 'package:dio/dio.dart';
import 'package:invesier/core/constant/endpoints.dart';
import 'package:invesier/features/model/get_posts_model.dart';

class GetPostsService {
  final Dio dio;

  GetPostsService({required this.dio});
  Future<GetPostsModel> getPosts({int perPage = 16}) async {
    final response = await dio.get(
      Endpoints.kGetPosts,
      queryParameters: {"per_page": perPage},
    );
    final data = response.data as Map<String, dynamic>;
    return GetPostsModel.fromJson(data);
  }
}
