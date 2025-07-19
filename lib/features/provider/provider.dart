import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/env.dart';
import 'package:invesier/features/service/create_post_services.dart';
import 'package:invesier/features/service/resend_otp_services.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: kBaseUrl));
});
final postServiceProvider = Provider<CreatePostServices>((ref) {
  return CreatePostServices(dio: ref.read(dioProvider));
});

final resendOtpServiceProvider = Provider<ResendOtpServices>((ref) {
  return ResendOtpServices(dio: ref.read(dioProvider));
});
