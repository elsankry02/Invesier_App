import 'package:dio/dio.dart';

import '../../models/get/get_post_model.dart';

class GetPostService {
  final Dio dio;

  GetPostService({required this.dio});
  Future<GetPostModel> getPost({required int postId}) async {
    final response = await dio.get("/social/posts/${postId}");
    final data = response.data as Map<String, dynamic>;
    return GetPostModel.fromJson(data);
  }
}
