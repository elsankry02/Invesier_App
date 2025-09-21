import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constant/app_strings.dart';
import '../../models/get/get_user_pioneers_model.dart';
import '../provider.dart';

abstract class GetUserPioneersState {}

class GetUserPioneersInitial extends GetUserPioneersState {}

class GetUserPioneersLoading extends GetUserPioneersState {}

class GetUserPioneersFailure extends GetUserPioneersState {
  final String errMessage;

  GetUserPioneersFailure({required this.errMessage});
}

class GetUserPioneersSuccess extends GetUserPioneersState {
  final List<GetUserPioneersModel> getUserPioneers;

  GetUserPioneersSuccess({required this.getUserPioneers});
}

class GetUserPioneersNotifier extends Notifier<GetUserPioneersState> {
  @override
  GetUserPioneersState build() {
    return GetUserPioneersInitial();
  }

  Future<void> getUserPioneers({String? search, String? username}) async {
    final provider = ref.read(getUserPioneersServiceProvider);
    state = GetUserPioneersLoading();
    try {
      final getUserPioneers = await provider.getUserPioneers(
        userName: username,
        search: search,
      );
      state = GetUserPioneersSuccess(getUserPioneers: getUserPioneers);
    } on Exception catch (e) {
      if (e is DioException) {
        final errmessage = e.response!.data;
        state = GetUserPioneersFailure(
          errMessage: errmessage[AppStrings.message],
        );
      }
    }
  }
}

final getUserPioneersProvider =
    NotifierProvider<GetUserPioneersNotifier, GetUserPioneersState>(
      GetUserPioneersNotifier.new,
    );
