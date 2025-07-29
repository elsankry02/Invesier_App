import 'dart:io';

import 'package:dio/dio.dart';
import 'package:invesier/features/model/complete_profile_model.dart';

import '../../core/constant/endpoints.dart';

class CompleteProfileService {
  final Dio dio;
  CompleteProfileService({required this.dio});
  Future<CompleteProfileModel> completeProfile({
    required String name,
    required String userName,
    required File avatar,
  }) async {
    final response = await dio.post(
      Endpoints.kCompleteProfile,
      data: FormData.fromMap({
        "name": name,
        "username": userName,
        "avatar": await MultipartFile.fromFile(avatar.path),
      }),
    );
    final completeData = response.data as Map<String, dynamic>;
    return CompleteProfileModel.fromJson(completeData);
  }
}
