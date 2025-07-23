import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/features/provider/provider.dart';

abstract class CompleteProfileState {}

class CompleteProfileInitial extends CompleteProfileState {}

class CompleteProfileSuccess extends CompleteProfileState {}

class CompleteProfileLoading extends CompleteProfileState {}

class CompleteProfileFailuer extends CompleteProfileState {
  final String errMassege;

  CompleteProfileFailuer({required this.errMassege});
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
      state = CompleteProfileFailuer(errMassege: e.toString());
    }
  }
}

final completeProfileProvider =
    NotifierProvider<CompleteProfileNotifier, CompleteProfileState>(
      CompleteProfileNotifier.new,
    );
