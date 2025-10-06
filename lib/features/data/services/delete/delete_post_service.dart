import 'package:dio/dio.dart';

class DeletePostService {
  final Dio dio;

  DeletePostService({required this.dio});
  Future<void> deletePost({required int id}) async {
    await dio.delete("/social/posts/${id}");
  }
}
