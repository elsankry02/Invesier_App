import 'dart:io';

import 'package:dio/dio.dart';
import '../../../core/constant/app_strings.dart';

import '../../../core/constant/endpoints.dart';

class CompleteProfileService {
  final Dio dio;
  CompleteProfileService({required this.dio});
  Future<void> completeProfile({
    required String name,
    required String userName,
    required File avatar,
  }) async {
    await dio.post(
      Endpoints.kCompleteProfile,
      data: FormData.fromMap({
        AppStrings.name: name,
        AppStrings.username: userName,
        AppStrings.avatar: await MultipartFile.fromFile(avatar.path),
      }),
    );
  }
}
