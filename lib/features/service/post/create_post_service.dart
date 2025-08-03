import 'dart:io';

import 'package:dio/dio.dart';

import '../../../core/constant/endpoints.dart';

class CreatePostService {
  final Dio dio;

  CreatePostService({required this.dio});

  Future<void> createPost({required String content, List<File>? media}) async {
    await dio.post(
      Endpoints.kCreatePost,
      data: {"content": content, if (media != null) "media": media},
    );
  }
}
