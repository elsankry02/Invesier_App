import 'dart:io';

import 'package:dio/dio.dart';
import 'package:invesier/core/endpoients/endpoients.dart';

class CreatePostServices {
  final Dio dio;

  CreatePostServices({required this.dio});

  Future<void> createPost({required String content, List<File>? media}) async {
    await dio.post(
      Endpoients.kCreatePost,
      data: {"content": content, if (media != null) "media": media},
    );
  }
}
