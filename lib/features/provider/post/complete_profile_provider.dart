import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    required String avatar,
    String? email,
  }) async {
    final provider = ref.read(completeProfileServiceProvider);
    try {
      state = CompleteProfileLoading();
      await provider.completeProfile(
        name: name,
        userName: userName,
        avatar: avatar,
        email: email,
      );
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
