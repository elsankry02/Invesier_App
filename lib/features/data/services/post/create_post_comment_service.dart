import 'package:dio/dio.dart';

class CreatePostCommentService {
  final Dio dio;

  CreatePostCommentService({required this.dio});
  Future<void> createPostComment({
    required int postId,
    required String content,
  }) async {
    await dio.post(
      "/social/posts/${postId}/comments",
      data: {"content": content},
    );
  }
}
