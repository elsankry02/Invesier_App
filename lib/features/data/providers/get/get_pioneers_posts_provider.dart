import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constant/app_strings.dart';
import '../../models/get/get_pioneers_posts_model.dart';
import '../provider.dart';

abstract class GetPioneersPostsState {}

class GetPioneersPostsInitial extends GetPioneersPostsState {}

class GetPioneersPostsLoading extends GetPioneersPostsState {}

class GetPioneersPostsSuccess extends GetPioneersPostsState {
  final List<GetPioneersPostsModel> getPioneersPosts;

  GetPioneersPostsSuccess({required this.getPioneersPosts});
}

class GetPioneersPostsFailure extends GetPioneersPostsState {
  final String errMessage;

  GetPioneersPostsFailure({required this.errMessage});
}

class GetPioneersPostsNotifier extends Notifier<GetPioneersPostsState> {
  @override
  GetPioneersPostsState build() {
    return GetPioneersPostsInitial();
  }

  Future<void> getPioneersPosts({
    String? search,
    String? cursor,
    String? filter,
  }) async {
    final provider = ref.read(getPioneersPostsServiceProvider);
    state = GetPioneersPostsLoading();
    try {
      final getPioneersPosts = await provider.getPioneersPosts(
        cursor: cursor,
        filter: filter,
        search: search,
      );
      state = GetPioneersPostsSuccess(getPioneersPosts: getPioneersPosts);
    } on Exception catch (e) {
      if (e is DioException) {
        final errMessage = e.response!.data;
        state = GetPioneersPostsFailure(
          errMessage: errMessage[AppStrings.message],
        );
      }
    }
  }
}

final getPioneersPostsProvider =
    NotifierProvider<GetPioneersPostsNotifier, GetPioneersPostsState>(
      GetPioneersPostsNotifier.new,
    );
