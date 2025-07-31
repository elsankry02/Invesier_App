import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/constant/app_strings.dart';
import 'package:invesier/features/service/get_authenticated_user_service.dart';
import 'package:invesier/features/service/remove_an_fcm_token_from_the_database_service.dart';
import 'package:invesier/features/service/store_the_fcm_token_for_the_authenticated_user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../env.dart';
import '../service/check_username_availability_service.dart';
import '../service/complete_profile_service.dart';
import '../service/create_post_service.dart';
import '../service/register_new_user_service.dart';
import '../service/resend_otp_service.dart';
import '../service/verify_otp_service.dart';

final dioProvider = Provider<Dio>((ref) {
  final token = ref.read(prefsProvider).getString(AppStrings.userToken);
  log("✅ Token after removal: $token");
  return Dio(
    BaseOptions(
      baseUrl: kBaseUrl,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        if (token != null) "Authorization": "Bearer $token",
      },
    ),
  );
});
// Create Post Services
final postServiceProvider = Provider<CreatePostService>((ref) {
  return CreatePostService(dio: ref.read(dioProvider));
});
// Resend Otp Services
final resendOtpServiceProvider = Provider<ResendOtpService>((ref) {
  return ResendOtpService(dio: ref.read(dioProvider));
});
// register New User Service Provider
final registerNewUserServiceProvider = Provider<RegisterNewUserService>((ref) {
  return RegisterNewUserService(dio: ref.read(dioProvider));
});
// Register Service
final verifyOtpServiceProvider = Provider<VerifyOtpService>((ref) {
  return VerifyOtpService(dio: ref.read(dioProvider));
});
// Complete Profile Service
final completeProfileServiceProvider = Provider<CompleteProfileService>((ref) {
  return CompleteProfileService(dio: ref.read(dioProvider));
});
// check User Name Availability Service Provider
final checkUserNameAvailabilityServiceProvider =
    Provider<CheckUserNameAvailabilityService>((ref) {
      return CheckUserNameAvailabilityService(dio: ref.read(dioProvider));
    });
// store The Fcm Token For The Authenticated User Service Provider
final storeTheFcmTokenForTheAuthenticatedUserServiceProvider =
    Provider<StoreTheFcmTokenForTheAuthenticatedUserService>((ref) {
      return StoreTheFcmTokenForTheAuthenticatedUserService(
        dio: ref.read(dioProvider),
      );
    });
// Remove An Fcm Token From The Database Service
final removeAnFcmTokenFromTheDatabaseServiceProvider =
    Provider<RemoveAnFcmTokenFromTheDatabaseService>((ref) {
      return RemoveAnFcmTokenFromTheDatabaseService(dio: ref.read(dioProvider));
    });
// Get Authenticated User Service
final getAuthenticatedUserServiceProvider =
    Provider<GetAuthenticatedUserService>((ref) {
      return GetAuthenticatedUserService(dio: ref.read(dioProvider));
    });
// prefs Provider
final prefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});
