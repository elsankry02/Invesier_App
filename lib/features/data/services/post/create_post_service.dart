import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/constant/app_strings.dart';
import '../../../../core/constant/endpoints.dart';

class CreatePostService {
  final Dio dio;

  CreatePostService({required this.dio});

  Future<void> createPost({required String content, List<File>? media}) async {
    await dio.post(
      Endpoints.kCreatePost,
      data: FormData.fromMap({
        AppStrings.content: content,
        if (media != null)
          AppStrings.media: await MultipartFile.fromFile(media.toString()),
      }),
      options: Options(
        headers: {
          AppStrings.contentType: "multipart/form-data",
          AppStrings.accept: "application/json",
        },
      ),
    );
  }
}
