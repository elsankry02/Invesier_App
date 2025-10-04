import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/get/get_list_post_comments_model.dart';

import '../../../../core/constant/app_strings.dart';
import '../provider.dart';

abstract class GetListPostCommentsState {}

class GetListPostCommentsInitial extends GetListPostCommentsState {}

class GetListPostCommentsLoading extends GetListPostCommentsState {}

class GetListPostCommentsFailure extends GetListPostCommentsState {
  final String errMessage;

  GetListPostCommentsFailure({required this.errMessage});
}

class GetListPostCommentsSuccess extends GetListPostCommentsState {
  final List<Datum> getListPostComments;

  GetListPostCommentsSuccess({required this.getListPostComments});
}

class GetListPostCommentsNotifier extends Notifier<GetListPostCommentsState> {
  @override
  GetListPostCommentsState build() {
    return GetListPostCommentsInitial();
  }

  Future<void> getListPostComments({required int postId}) async {
    final provider = ref.read(getListPostCommentsServiceProvider);
    state = GetListPostCommentsLoading();
    try {
      final getListPostComments = await provider.getListPostComments(
        postId: postId,
      );
      state = GetListPostCommentsSuccess(
        getListPostComments: getListPostComments,
      );
    } on Exception catch (e) {
      if (e is DioException) {
        final errMessage = e.response!.data;
        state = GetListPostCommentsFailure(
          errMessage: errMessage[AppStrings.message],
        );
      }
    }
  }
}

final getListPostCommentsProvider =
    NotifierProvider<GetListPostCommentsNotifier, GetListPostCommentsState>(
      GetListPostCommentsNotifier.new,
    );
