import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/env.dart';
import 'package:invesier/features/service/check_username_availability_service.dart';
import 'package:invesier/features/service/complete_profile_service.dart';
import 'package:invesier/features/service/create_post_services.dart';
import 'package:invesier/features/service/register_new_user_service.dart';
import 'package:invesier/features/service/resend_otp_service.dart';
import 'package:invesier/features/service/verify_otp_service.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(
      baseUrl: kBaseUrl,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    ),
  );
});
// Create Post Services
final postServiceProvider = Provider<CreatePostServices>((ref) {
  return CreatePostServices(dio: ref.read(dioProvider));
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
