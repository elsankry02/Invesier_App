import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/constant/app_strings.dart';
import 'package:invesier/features/data/providers/provider.dart';

abstract class DeleteCommentState {}

class DeleteCommentInitial extends DeleteCommentState {}

class DeleteCommentLoading extends DeleteCommentState {}

class DeleteCommentSuccess extends DeleteCommentState {}

class DeleteCommentFailure extends DeleteCommentState {
  final String errmessage;

  DeleteCommentFailure({required this.errmessage});
}

class DeleteCommentNotifier extends Notifier<DeleteCommentState> {
  @override
  DeleteCommentState build() {
    return DeleteCommentInitial();
  }

  Future<void> deleteComment({required int id}) async {
    final provider = ref.read(deleteCommentServiceProvider);
    state = DeleteCommentLoading();
    try {
      await provider.deleteComment(id: id);
      state = DeleteCommentSuccess();
    } on Exception catch (e) {
      if (e is DioException) {
        final errmessage = e.response!.data;
        state = DeleteCommentFailure(
          errmessage: errmessage[AppStrings.message],
        );
      }
    }
  }
}

final deleteCommentProvider =
    NotifierProvider<DeleteCommentNotifier, DeleteCommentState>(
      DeleteCommentNotifier.new,
    );
