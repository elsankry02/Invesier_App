import 'package:dio/dio.dart';
import '../../core/constant/endpoints.dart';

class CompleteProfileService {
  final Dio dio;
  CompleteProfileService({required this.dio});
  Future<void> completeProfile({
    required String name,
    required String userName,
    required String avatar,
    String? email,
  }) async {
    await dio.post(
      Endpoints.kCompleteProfile,
      data: {
        "name": name,
        "username": userName,
        "avatar": avatar,
        if (email != null) "email": email,
      },
    );
  }
}
