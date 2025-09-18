import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constant/app_strings.dart';
import '../../models/get_user_profile_model.dart';
import '../provider.dart';

abstract class GetUserProfileState {}

class GetUserProfileintial extends GetUserProfileState {}

class GetUserProfileLoading extends GetUserProfileState {}

class GetUserProfileFailure extends GetUserProfileState {
  final String errMessage;

  GetUserProfileFailure({required this.errMessage});
}

class GetUserProfileSuccess extends GetUserProfileState {
  final GetUserProfileModel getUserProfileModel;

  GetUserProfileSuccess({required this.getUserProfileModel});
}

class GetUserProfileNotifier extends AutoDisposeNotifier<GetUserProfileState> {
  @override
  GetUserProfileState build() {
    return GetUserProfileintial();
  }

  Timer? debounce;

  Future<void> getUserProfile({required String username}) async {
    final provider = ref.read(getUserProfileServiceProvider);
    if (debounce?.isActive ?? false) debounce!.cancel();
    debounce = Timer(Duration(milliseconds: 400), () async {
      state = GetUserProfileLoading();
      try {
        final data = await provider.getUserProfile(username: username);
        state = GetUserProfileSuccess(getUserProfileModel: data);
      } on Exception catch (e) {
        if (e is DioException) {
          final errMessage = e.response!.data;
          state = GetUserProfileFailure(
            errMessage: errMessage[AppStrings.message],
          );
        }
      }
    });
  }
}

final getUserProfileProvider =
    NotifierProvider.autoDispose<GetUserProfileNotifier, GetUserProfileState>(
      GetUserProfileNotifier.new,
    );
