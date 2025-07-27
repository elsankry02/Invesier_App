import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider.dart';

class RegisterNewUserState {}

class RegisterNewUserInitial extends RegisterNewUserState {}

class RegisterNewUserSuccess extends RegisterNewUserState {}

class RegisterNewUserLoading extends RegisterNewUserState {}

class RegisterNewUserFailure extends RegisterNewUserState {
  final String errMassege;

  RegisterNewUserFailure({required this.errMassege});
}

class RegisterNotifier extends Notifier<RegisterNewUserState> {
  @override
  RegisterNewUserState build() {
    return RegisterNewUserInitial();
  }

  Future<void> registerNewUser({
    required String authMethod,
    String? phonePrefix,
    String? email,
    String? phone,
  }) async {
    final provider = ref.read(registerNewUserServiceProvider);
    try {
      state = RegisterNewUserLoading();
      await provider.registerNewUser(
        authMethod: authMethod,
        phonePrefix: phonePrefix,
        phone: phone,
        email: email,
      );
      state = RegisterNewUserSuccess();
    } on Exception catch (e) {
      state = RegisterNewUserFailure(errMassege: e.toString());
    }
  }
}

final registerNewUserProvider =
    NotifierProvider<RegisterNotifier, RegisterNewUserState>(
      RegisterNotifier.new,
    );
