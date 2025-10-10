import 'package:dio/dio.dart';
import '../../models/get/get_comment_model.dart';

class GetCommentService {
  final Dio dio;

  GetCommentService({required this.dio});
  Future<GetCommentModel> getComment({required int postId}) async {
    final response = await dio.get("/social/comments/${postId}");
    final data = response.data as Map<String, dynamic>;
    return GetCommentModel.fromJson(data);
  }
}
