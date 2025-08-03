import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/constant/app_strings.dart';

import '../../model/user_model.dart';
import '../provider.dart';

abstract class GetAuthenticatedUserState {}

class GetAuthenticatedUserInitial extends GetAuthenticatedUserState {}

class GetAuthenticatedUserSuccess extends GetAuthenticatedUserState {
  final UserModel userModel;

  GetAuthenticatedUserSuccess({required this.userModel});
}

class GetAuthenticatedUserFaliure extends GetAuthenticatedUserState {
  final String errMessage;

  GetAuthenticatedUserFaliure({required this.errMessage});
}

class GetAuthenticatedUserNotifier
    extends AutoDisposeNotifier<GetAuthenticatedUserState> {
  @override
  GetAuthenticatedUserState build() {
    return GetAuthenticatedUserInitial();
  }

  Future<void> getUser() async {
    final provider = ref.read(getAuthenticatedUserServiceProvider);
    try {
      final userData = await provider.getUser();
      state = GetAuthenticatedUserSuccess(userModel: userData);
    } on Exception catch (e) {
      if (e is DioException) {
        final data = e.response!.data;
        state = GetAuthenticatedUserFaliure(
          errMessage: data[AppStrings.message],
        );
      }
    }
  }
}

final getAuthenticatedUserProvider = AutoDisposeNotifierProvider<
  GetAuthenticatedUserNotifier,
  GetAuthenticatedUserState
>(GetAuthenticatedUserNotifier.new);
