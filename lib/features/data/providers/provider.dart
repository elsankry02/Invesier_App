import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constant/app_strings.dart';
import '../../../env.dart';
import '../services/delete/delete_account_service.dart';
import '../services/delete/delete_comment.dart';
import '../services/delete/delete_post_service.dart';
import '../services/get/get_authenticated_user_service.dart';
import '../services/get/get_comment_service.dart';
import '../services/get/get_list_post_comments_service.dart';
import '../services/get/get_list_users_service.dart';
import '../services/get/get_pioneers_posts_service.dart';
import '../services/get/get_post_service.dart';
import '../services/get/get_posts_service.dart';
import '../services/get/get_user_fans_service.dart';
import '../services/get/get_user_pioneers_service.dart';
import '../services/get/get_user_posts_service.dart';
import '../services/get/get_user_profile_service.dart';
import '../services/post/check_username_availability_service.dart';
import '../services/post/complete_profile_service.dart';
import '../services/post/create_post_comment_service.dart';
import '../services/post/create_post_service.dart';
import '../services/post/logout_service.dart';
import '../services/post/register_new_user_service.dart';
import '../services/post/remove_an_fcm_token_from_the_database_service.dart';
import '../services/post/resend_otp_service.dart';
import '../services/post/store_the_fcm_token_for_the_authenticated_user_service.dart';
import '../services/post/verify_otp_service.dart';

final dioProvider = Provider<Dio>((ref) {
  final prefs = ref.watch(prefsProvider);
  final token = prefs.getString(AppStrings.userToken);
  log("Token : $token");
  return Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {
        if (token != null) AppStrings.authorization: "Bearer $token",
        AppStrings.contentType: "application/json",
        AppStrings.accept: "application/json",
      },
    ),
  );
});
final createPostServiceProvider = Provider<CreatePostService>((ref) {
  return CreatePostService(dio: ref.read(dioProvider));
});
final resendOtpServiceProvider = Provider<ResendOtpService>((ref) {
  return ResendOtpService(dio: ref.read(dioProvider));
});
final registerNewUserServiceProvider = Provider<RegisterNewUserService>((ref) {
  return RegisterNewUserService(dio: ref.read(dioProvider));
});
final verifyOtpServiceProvider = Provider<VerifyOtpService>((ref) {
  return VerifyOtpService(dio: ref.read(dioProvider));
});
final completeProfileServiceProvider = Provider<CompleteProfileService>((ref) {
  return CompleteProfileService(dio: ref.read(dioProvider));
});
final checkUserNameAvailabilityServiceProvider =
    Provider<CheckUserNameAvailabilityService>((ref) {
      return CheckUserNameAvailabilityService(dio: ref.read(dioProvider));
    });
final storeTheFcmTokenForTheAuthenticatedUserServiceProvider =
    Provider<StoreTheFcmTokenForTheAuthenticatedUserService>((ref) {
      return StoreTheFcmTokenForTheAuthenticatedUserService(
        dio: ref.read(dioProvider),
      );
    });
final removeAnFcmTokenFromTheDatabaseServiceProvider =
    Provider<RemoveAnFcmTokenFromTheDatabaseService>((ref) {
      return RemoveAnFcmTokenFromTheDatabaseService(dio: ref.read(dioProvider));
    });
final getAuthenticatedUserServiceProvider =
    Provider<GetAuthenticatedUserService>((ref) {
      return GetAuthenticatedUserService(dio: ref.read(dioProvider));
    });
final logoutServiceProvider = Provider<LogoutService>((ref) {
  return LogoutService(dio: ref.read(dioProvider));
});
final deleteAccountServiceProvider = Provider<DeleteAccountService>((ref) {
  return DeleteAccountService(dio: ref.read(dioProvider));
});
final prefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});
final getPostsServiceProvider = Provider<GetPostsService>((ref) {
  return GetPostsService(dio: ref.read(dioProvider));
});
final getUserProfileServiceProvider = Provider<GetUserProfileService>((ref) {
  return GetUserProfileService(dio: ref.read(dioProvider));
});
final getListUsersServiceProvider = Provider<GetListUsersService>((ref) {
  return GetListUsersService(dio: ref.read(dioProvider));
});
final getUserPioneersServiceProvider = Provider<GetUserPioneersService>((ref) {
  return GetUserPioneersService(dio: ref.read(dioProvider));
});
final getUserFansServiceProvider = Provider<GetUserFansService>((ref) {
  return GetUserFansService(dio: ref.read(dioProvider));
});
final getUserPostsServiceProvider = Provider<GetUserPostsService>((ref) {
  return GetUserPostsService(dio: ref.read(dioProvider));
});
final getPioneersPostsServiceProvider = Provider<GetPioneersPostsService>((
  ref,
) {
  return GetPioneersPostsService(dio: ref.read(dioProvider));
});
final getPostServiceProvider = Provider<GetPostService>((ref) {
  return GetPostService(dio: ref.read(dioProvider));
});
final getListPostCommentsServiceProvider = Provider<GetListPostCommentsService>(
  (ref) {
    return GetListPostCommentsService(dio: ref.read(dioProvider));
  },
);
final deletePostServiceProvider = Provider<DeletePostService>((ref) {
  return DeletePostService(dio: ref.read(dioProvider));
});
final createPostCommentServiceProvider = Provider<CreatePostCommentService>((
  ref,
) {
  return CreatePostCommentService(dio: ref.read(dioProvider));
});
final getCommnetServiceProvider = Provider<GetCommentService>((ref) {
  return GetCommentService(dio: ref.read(dioProvider));
});
final deleteCommentServiceProvider = Provider<DeleteCommentService>((ref) {
  return DeleteCommentService(dio: ref.read(dioProvider));
});
