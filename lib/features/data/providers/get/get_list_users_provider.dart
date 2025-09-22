import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constant/app_strings.dart';
import '../../models/get/get_list_users_model.dart';

import '../provider.dart';

abstract class GetListUsersState {}

class GetListUsersintial extends GetListUsersState {}

class GetListUsersLoading extends GetListUsersState {}

class GetListUsersFailure extends GetListUsersState {
  final String errMessage;

  GetListUsersFailure({required this.errMessage});
}

class GetListUsersSuccess extends GetListUsersState {
  final List<Datum> getlistUsers;

  GetListUsersSuccess({required this.getlistUsers});
}

class GetListUsersNotifier extends AutoDisposeNotifier<GetListUsersState> {
  @override
  GetListUsersState build() {
    return GetListUsersintial();
  }

  Timer? debounce;

  Future<void> getListUsers({String? userName}) async {
    final provider = ref.read(getListUsersServiceProvider);
    if (debounce?.isActive ?? false) debounce!.cancel();
    debounce = Timer(Duration(milliseconds: 400), () async {
      state = GetListUsersLoading();
      try {
        final getlistUsers = await provider.getListUsers(userName: userName);
        state = GetListUsersSuccess(getlistUsers: getlistUsers);
      } on Exception catch (e) {
        if (e is DioException) {
          final errMessage = e.response!.data;
          state = GetListUsersFailure(
            errMessage: errMessage[AppStrings.message],
          );
        }
      }
    });
  }
}

final getListUsersProvider =
    NotifierProvider.autoDispose<GetListUsersNotifier, GetListUsersState>(
      GetListUsersNotifier.new,
    );
