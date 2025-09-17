import 'package:dio/dio.dart';
import '../../models/get_user_profile_model.dart';

class GetUserProfileService {
  final Dio dio;

  GetUserProfileService({required this.dio});

  Future<GetUserProfileModel> getUserProfile({required String username}) async {
    final response = await dio.get("/social/profiles/${username}");
    final data = response.data as Map<String, dynamic>;
    return GetUserProfileModel.fromJson(data);
  }
}
