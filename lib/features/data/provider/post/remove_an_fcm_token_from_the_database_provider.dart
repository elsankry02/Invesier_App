import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider.dart';

abstract class RemoveAnFcmTokenFromTheDatabaseState {}

class RemoveAnFcmTokenFromTheDatabaseInitial
    extends RemoveAnFcmTokenFromTheDatabaseState {}

class RemoveAnFcmTokenFromTheDatabaseLoading
    extends RemoveAnFcmTokenFromTheDatabaseState {}

class RemoveAnFcmTokenFromTheDatabaseSuccess
    extends RemoveAnFcmTokenFromTheDatabaseState {}

class RemoveAnFcmTokenFromTheDatabaseFailure
    extends RemoveAnFcmTokenFromTheDatabaseState {
  final String errMessage;

  RemoveAnFcmTokenFromTheDatabaseFailure({required this.errMessage});
}

class RemoveAnFcmTokenFromTheDatabaseNotifier
    extends Notifier<RemoveAnFcmTokenFromTheDatabaseState> {
  @override
  RemoveAnFcmTokenFromTheDatabaseState build() {
    return RemoveAnFcmTokenFromTheDatabaseInitial();
  }

  Future<void> removeAnFcmTokenFromTheDatabase({required String token}) async {
    final provider = ref.read(removeAnFcmTokenFromTheDatabaseServiceProvider);
    try {
      state = RemoveAnFcmTokenFromTheDatabaseLoading();
      await provider.removeAnFcmTokenFromTheDatabase(token: token);
      state = RemoveAnFcmTokenFromTheDatabaseSuccess();
    } on Exception catch (e) {
      state = RemoveAnFcmTokenFromTheDatabaseFailure(errMessage: e.toString());
    }
  }
}

final removeAnFcmTokenFromTheDatabaseProvider = NotifierProvider<
  RemoveAnFcmTokenFromTheDatabaseNotifier,
  RemoveAnFcmTokenFromTheDatabaseState
>(RemoveAnFcmTokenFromTheDatabaseNotifier.new);
