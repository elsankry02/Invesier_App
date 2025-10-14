import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constant/app_strings.dart';
import '../provider.dart';

abstract class CreatePostCommentState {}

class CreatePostCommentInitial extends CreatePostCommentState {}

class CreatePostCommentSuccess extends CreatePostCommentState {}

class CreatePostCommentLoading extends CreatePostCommentState {}

class CreatePostCommentFailure extends CreatePostCommentState {
  final String errMessage;

  CreatePostCommentFailure({required this.errMessage});
}

class CreatePostCommentNotifier extends Notifier<CreatePostCommentState> {
  @override
  CreatePostCommentState build() {
    return CreatePostCommentInitial();
  }

  Future<void> createPostComment({
    required String content,
    required int postId,
  }) async {
    final provider = ref.read(createPostCommentServiceProvider);
    state = CreatePostCommentLoading();
    try {
      await provider.createPostComment(content: content, postId: postId);
      state = CreatePostCommentSuccess();
    } on Exception catch (e) {
      if (e is DioException) {
        final message = e.response!.data;
        state = CreatePostCommentFailure(
          errMessage: message[AppStrings.message],
        );
      }
    }
  }
}

final createPostCommnetProvider =
    NotifierProvider<CreatePostCommentNotifier, CreatePostCommentState>(
      CreatePostCommentNotifier.new,
    );
