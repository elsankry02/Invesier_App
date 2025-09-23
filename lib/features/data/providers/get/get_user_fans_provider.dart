import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/features/data/models/get/get_user_fans_model.dart';
import 'package:invesier/features/data/providers/provider.dart';

abstract class GetUserFansState {}

class GetUserFansInitial extends GetUserFansState {}

class GetUserFansLoading extends GetUserFansState {}

class GetUserFansFailure extends GetUserFansState {
  final String errMessage;

  GetUserFansFailure({required this.errMessage});
}

class GetUserFansSuccess extends GetUserFansState {
  final List<GetUserFansModel> getUserFans;

  GetUserFansSuccess({required this.getUserFans});
}

class GetUserFansNotifier extends AutoDisposeNotifier<GetUserFansState> {
  @override
  GetUserFansState build() {
    return GetUserFansInitial();
  }

  Timer? debounce;

  Future<void> getUserFans({required String username, String? search}) async {
    if (debounce?.isActive ?? false) debounce!.cancel();
    debounce = Timer(Duration(milliseconds: 500), () async {
      final provider = ref.read(getUserFansServiceProvider);
      state = GetUserFansLoading();
      try {
        final getUserFans = await provider.getUserFans(
          username: username,
          search: search,
        );
        state = GetUserFansSuccess(getUserFans: getUserFans);
      } on Exception catch (e) {
        if (e is DioException) {
          final errMessage = e.response!.data;
          state = GetUserFansFailure(errMessage: errMessage);
        }
      }
    });
  }
}

final getUserFansProvider =
    NotifierProvider.autoDispose<GetUserFansNotifier, GetUserFansState>(
      GetUserFansNotifier.new,
    );
