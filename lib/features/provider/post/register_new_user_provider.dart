import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/features/provider/provider.dart';

class RegisterNewUserState {}

class RegisterNewUserInitial extends RegisterNewUserState {}

class RegisterNewUserSuccess extends RegisterNewUserState {}

class RegisterNewUserLoading extends RegisterNewUserState {}

class RegisterNewUserFaliuer extends RegisterNewUserState {
  final String errMassege;

  RegisterNewUserFaliuer({required this.errMassege});
}

class RegisterNotifier extends Notifier<RegisterNewUserState> {
  @override
  RegisterNewUserState build() {
    return RegisterNewUserInitial();
  }

  Future<void> registerNewUser({
    required String authMethod,
    String? email,
    String? phone,
  }) async {
    final provider = ref.read(registerNewUserServiceProvider);
    try {
      state = RegisterNewUserLoading();
      await provider.registerNewUser(
        authMethod: authMethod,
        phone: phone,
        email: email,
      );
      state = RegisterNewUserSuccess();
    } on Exception catch (e) {
      state = RegisterNewUserFaliuer(errMassege: e.toString());
    }
  }
}

final registerNewUserProvider =
    NotifierProvider<RegisterNotifier, RegisterNewUserState>(
      RegisterNotifier.new,
    );
