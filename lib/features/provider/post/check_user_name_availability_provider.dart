import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/features/provider/provider.dart';

abstract class CheckUserNameAvailabilityState {}

class CheckUserNameAvailabilityInitial extends CheckUserNameAvailabilityState {}

class CheckUserNameAvailabilityLoading extends CheckUserNameAvailabilityState {}

class CheckUserNameAvailabilitySuccess extends CheckUserNameAvailabilityState {}

class CheckUserNameAvailabilityFailuer extends CheckUserNameAvailabilityState {
  final String errMassege;

  CheckUserNameAvailabilityFailuer({required this.errMassege});
}

class CheckUserNameAvailabilityNotifier
    extends Notifier<CheckUserNameAvailabilityState> {
  @override
  CheckUserNameAvailabilityState build() {
    return CheckUserNameAvailabilityInitial();
  }

  Future<void> checkUserNameAvailability({required String username}) async {
    final provider = ref.read(checkUserNameAvailabilityServiceProvider);
    try {
      CheckUserNameAvailabilityLoading();
      await provider.checkUsernameAvailability(username: username);
      CheckUserNameAvailabilitySuccess();
    } on Exception catch (e) {
      CheckUserNameAvailabilityFailuer(errMassege: e.toString());
    }
  }
}

final checkUserNameAvailabilityProvider = NotifierProvider<
  CheckUserNameAvailabilityNotifier,
  CheckUserNameAvailabilityState
>(CheckUserNameAvailabilityNotifier.new);
