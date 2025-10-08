import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/features/data/models/get_comment_model.dart';

import '../../../../core/constant/app_strings.dart';
import '../provider.dart';

abstract class GetCommentState {}

class GetCommentInitial extends GetCommentState {}

class GetCommentLoading extends GetCommentState {}

class GetCommentSuccess extends GetCommentState {
  final GetCommentModel getComment;

  GetCommentSuccess({required this.getComment});
}

class GetCommentFailure extends GetCommentState {
  final String errmessage;

  GetCommentFailure({required this.errmessage});
}

class GetCommentNotifier extends Notifier<GetCommentState> {
  @override
  GetCommentState build() {
    return GetCommentInitial();
  }

  Future<void> getComment({required int postId}) async {
    final provider = ref.read(getCommnetServiceProvider);
    state = GetCommentLoading();

    try {
      final getComment = await provider.getComment(postId: postId);

      state = GetCommentSuccess(getComment: getComment);
    } on Exception catch (e) {
      if (e is DioException) {
        final errmessage = e.response!.data;
        state = GetCommentFailure(errmessage: errmessage[AppStrings.message]);
      }
    }
  }
}

final getCommentProvider =
    NotifierProvider<GetCommentNotifier, GetCommentState>(
      GetCommentNotifier.new,
    );
