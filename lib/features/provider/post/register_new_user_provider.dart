import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constant/app_strings.dart';
import '../provider.dart';

class RegisterNewUserState {}

class RegisterNewUserInitial extends RegisterNewUserState {}

class RegisterNewUserSuccess extends RegisterNewUserState {}

class RegisterNewUserLoading extends RegisterNewUserState {}

class RegisterNewUserFailure extends RegisterNewUserState {
  final String errMessage;

  RegisterNewUserFailure({required this.errMessage});
}

class RegisterNotifier extends Notifier<RegisterNewUserState> {
  @override
  RegisterNewUserState build() {
    return RegisterNewUserInitial();
  }

  Future<void> registerNewUser({
    required String authMethod,
    String? prefix,
    String? phonePrefix,
    String? email,
    String? phone,
  }) async {
    final provider = ref.read(registerNewUserServiceProvider);
    try {
      state = RegisterNewUserLoading();
      await provider.registerNewUser(
        prefix: prefix,
        authMethod: authMethod,
        phonePrefix: phonePrefix,
        phone: phone,
        email: email,
      );
      state = RegisterNewUserSuccess();
    } on Exception catch (e) {
      if (e is DioException) {
        final data = e.response!.data;
        state = RegisterNewUserFailure(errMessage: data[AppStrings.message]);
      }
    }
  }
}

final registerNewUserProvider =
    NotifierProvider<RegisterNotifier, RegisterNewUserState>(
      RegisterNotifier.new,
    );
