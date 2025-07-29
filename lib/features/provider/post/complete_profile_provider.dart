import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/constant/app_strings.dart';

import '../provider.dart';

abstract class CompleteProfileState {}

class CompleteProfileInitial extends CompleteProfileState {}

class CompleteProfileSuccess extends CompleteProfileState {}

class CompleteProfileLoading extends CompleteProfileState {}

class CompleteProfileFailure extends CompleteProfileState {
  final String errMessage;

  CompleteProfileFailure({required this.errMessage});
}

class CompleteProfileNotifier extends Notifier<CompleteProfileState> {
  @override
  CompleteProfileState build() {
    return CompleteProfileInitial();
  }

  Future<void> completeProfile({
    required String name,
    required String userName,
    required File avatar,
    required String email,
  }) async {
    final provider = ref.read(completeProfileServiceProvider);
    try {
      state = CompleteProfileLoading();

      final completeData = await provider.completeProfile(
        name: name,
        userName: userName,
        avatar: avatar,
        email: email,
      );
      final token = completeData.token;
      await ref.read(prefsProvider).setString(AppStrings.userToken, token);
      log("TOKEN: $token");
      state = CompleteProfileSuccess();
    } on Exception catch (e) {
      state = CompleteProfileFailure(errMessage: e.toString());
    }
  }
}

final completeProfileProvider =
    NotifierProvider<CompleteProfileNotifier, CompleteProfileState>(
      CompleteProfileNotifier.new,
    );
