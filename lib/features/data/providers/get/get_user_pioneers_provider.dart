import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/constant/app_strings.dart';
import 'package:invesier/features/data/models/get_user_pioneers_model.dart';
import 'package:invesier/features/data/providers/provider.dart';

abstract class GetUserPioneersState {}

class GetUserPioneersInitial extends GetUserPioneersState {}

class GetUserPioneersLoading extends GetUserPioneersState {}

class GetUserPioneersFailure extends GetUserPioneersState {
  final String errMessage;

  GetUserPioneersFailure({required this.errMessage});
}

class GetUserPioneersSuccess extends GetUserPioneersState {
  final List<GetUserPioneersModel> getUserPioneersModel;

  GetUserPioneersSuccess({required this.getUserPioneersModel});
}

class GetUserPioneersNotifier
    extends AutoDisposeNotifier<GetUserPioneersState> {
  @override
  GetUserPioneersState build() {
    return GetUserPioneersInitial();
  }

  Timer? debounce;

  Future<void> getUserPioneers({
    String? search,
    required String username,
  }) async {
    final provider = ref.read(getUserPioneersServiceProvider);
    if (debounce?.isActive ?? false) debounce!.cancel();
    debounce = Timer(Duration(milliseconds: 400), () async {
      state = GetUserPioneersLoading();
      try {
        final getUserPioneers = await provider.getUserPioneers(
          username: username,
          search: search,
        );
        state = GetUserPioneersSuccess(getUserPioneersModel: getUserPioneers);
      } on Exception catch (e) {
        if (e is DioException) {
          final errmessage = e.response!.data;
          state = GetUserPioneersFailure(
            errMessage: errmessage[AppStrings.message],
          );
        }
      }
    });
  }
}

final getUserPioneersProvider =
    NotifierProvider.autoDispose<GetUserPioneersNotifier, GetUserPioneersState>(
      GetUserPioneersNotifier.new,
    );
