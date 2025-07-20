import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/features/provider/provider.dart';

class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterFaliuer extends RegisterState {
  final String errMassege;

  RegisterFaliuer({required this.errMassege});
}

class RegisterNotifier extends Notifier<RegisterState> {
  @override
  RegisterState build() {
    return RegisterInitial();
  }

  Future<void> register({
    required String authMethod,
    String? email,
    String? phone,
  }) async {
    final provider = ref.read(registerServiceProvider);
    try {
      state = RegisterLoading();
      await provider.register(
        authMethod: authMethod,
        phone: phone,
        email: email,
      );
      state = RegisterSuccess();
    } on Exception catch (e) {
      state = RegisterFaliuer(errMassege: e.toString());
    }
  }
}

final registerProvider = NotifierProvider<RegisterNotifier, RegisterState>(
  RegisterNotifier.new,
);
