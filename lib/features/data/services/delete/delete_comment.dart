import 'package:dio/dio.dart';

class DeleteCommentService {
  final Dio dio;

  DeleteCommentService({required this.dio});
  Future<void> deleteComment({required int id}) async {
    await dio.delete("/social/comments/${id}");
  }
}
