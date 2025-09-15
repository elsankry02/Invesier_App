import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/constant/app_strings.dart';
import 'package:invesier/features/data/models/get_user_profile_model.dart';
import 'package:invesier/features/data/providers/provider.dart';

abstract class GetUserProfileState {}

class GetUserProfileintial extends GetUserProfileState {}

class GetUserProfileLoading extends GetUserProfileState {}

class GetUserProfileFailure extends GetUserProfileState {
  final String errMessage;

  GetUserProfileFailure({required this.errMessage});
}

class GetUserProfileSuccess extends GetUserProfileState {
  final GetUserProfileModel userData;

  GetUserProfileSuccess({required this.userData});
}

class GetUserProfileNotifier extends Notifier<GetUserProfileState> {
  @override
  GetUserProfileState build() {
    return GetUserProfileintial();
  }

  Future<void> getUserProfile({required String username}) async {
    final provider = ref.read(getUserProfileServiceProvider);
    try {
      state = GetUserProfileLoading();
      final data = await provider.getUserProfile(username: username);
      state = GetUserProfileSuccess(userData: data);
    } on Exception catch (e) {
      if (e is DioException) {
        final errMessage = e.response!.data;
        state = GetUserProfileFailure(
          errMessage: errMessage[AppStrings.message],
        );
      }
    }
  }
}

final getUserProfileProvider =
    NotifierProvider<GetUserProfileNotifier, GetUserProfileState>(
      GetUserProfileNotifier.new,
    );
