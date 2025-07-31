import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/features/model/user_model.dart';
import 'package:invesier/features/provider/provider.dart';

abstract class GetAuthenticatedUserState {}

class GetAuthenticatedUserInitial extends GetAuthenticatedUserState {}

class GetAuthenticatedUserLoading extends GetAuthenticatedUserState {}

class GetAuthenticatedUserSuccess extends GetAuthenticatedUserState {
  final UserModel userModel;

  GetAuthenticatedUserSuccess({required this.userModel});
}

class GetAuthenticatedUserFaliure extends GetAuthenticatedUserState {
  final String errMessage;

  GetAuthenticatedUserFaliure({required this.errMessage});
}

class GetAuthenticatedUserNotifier extends Notifier<GetAuthenticatedUserState> {
  @override
  GetAuthenticatedUserState build() {
    return GetAuthenticatedUserInitial();
  }

  Future<void> getUser() async {
    final provider = ref.read(getAuthenticatedUserServiceProvider);
    try {
      state = GetAuthenticatedUserLoading();

      final userData = await provider.getUser();
      state = GetAuthenticatedUserSuccess(userModel: userData);
    } on Exception catch (e) {
      state = GetAuthenticatedUserFaliure(errMessage: e.toString());
    }
  }
}

final getAuthenticatedUserProvider =
    NotifierProvider<GetAuthenticatedUserNotifier, GetAuthenticatedUserState>(
      GetAuthenticatedUserNotifier.new,
    );
