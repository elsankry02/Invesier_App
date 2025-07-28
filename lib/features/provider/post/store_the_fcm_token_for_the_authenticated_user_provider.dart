import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/features/provider/provider.dart';

abstract class StoreTheFcmTokenForTheAuthenticatedUserState {}

class StoreTheFcmTokenForTheAuthenticatedUserInitial
    extends StoreTheFcmTokenForTheAuthenticatedUserState {}

class StoreTheFcmTokenForTheAuthenticatedUserLoading
    extends StoreTheFcmTokenForTheAuthenticatedUserState {}

class StoreTheFcmTokenForTheAuthenticatedUserSuccess
    extends StoreTheFcmTokenForTheAuthenticatedUserState {}

class StoreTheFcmTokenForTheAuthenticatedUserFailure
    extends StoreTheFcmTokenForTheAuthenticatedUserState {
  final String errMessage;

  StoreTheFcmTokenForTheAuthenticatedUserFailure({required this.errMessage});
}

class StoreTheFcmTokenForTheAuthenticatedUserNotifier
    extends Notifier<StoreTheFcmTokenForTheAuthenticatedUserState> {
  @override
  StoreTheFcmTokenForTheAuthenticatedUserState build() {
    return StoreTheFcmTokenForTheAuthenticatedUserInitial();
  }

  Future<void> storeTheFcmTokenForTheAuthenticatedUser({
    required String token,
    String? deviceType,
  }) async {
    final provider = ref.read(
      storeTheFcmTokenForTheAuthenticatedUserServiceProvider,
    );
    try {
      state = StoreTheFcmTokenForTheAuthenticatedUserLoading();
      await provider.storeTheFcmTokenForTheAuthenticatedUser(
        token: token,
        deviceType: deviceType,
      );
      state = StoreTheFcmTokenForTheAuthenticatedUserSuccess();
    } catch (e) {
      state = StoreTheFcmTokenForTheAuthenticatedUserFailure(
        errMessage: e.toString(),
      );
    }
  }
}

final storeTheFcmTokenForTheAuthenticatedUserProvider = NotifierProvider<
  StoreTheFcmTokenForTheAuthenticatedUserNotifier,
  StoreTheFcmTokenForTheAuthenticatedUserState
>(StoreTheFcmTokenForTheAuthenticatedUserNotifier.new);
