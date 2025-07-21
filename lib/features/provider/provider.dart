import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/env.dart';
import 'package:invesier/features/service/create_post_services.dart';
import 'package:invesier/features/service/register_service.dart';
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
// CreatePostServices
final postServiceProvider = Provider<CreatePostServices>((ref) {
  return CreatePostServices(dio: ref.read(dioProvider));
});
// ResendOtpServices
final resendOtpServiceProvider = Provider<ResendOtpService>((ref) {
  return ResendOtpService(dio: ref.read(dioProvider));
});
// RegisterService
final registerServiceProvider = Provider<RegisterService>((ref) {
  return RegisterService(dio: ref.read(dioProvider));
});
// RegisterService
final verifyOtpServiceProvider = Provider<VerifyOtpService>((ref) {
  return VerifyOtpService(dio: ref.read(dioProvider));
});
