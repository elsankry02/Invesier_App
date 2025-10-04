import 'package:dio/dio.dart';
import '../../models/get/get_list_post_comments_model.dart';

class GetListPostCommentsService {
  final Dio dio;

  GetListPostCommentsService({required this.dio});
  Future<List<Datum>> getListPostComments({required int postId}) async {
    final response = await dio.get("/social/posts/${postId}/comments");
    final data = response.data as Map<String, dynamic>;
    final result = data["data"] as List<dynamic>;
    return result
        .map((e) => Datum.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
