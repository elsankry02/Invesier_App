import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constant/app_strings.dart';
import '../provider.dart';

abstract class CreatePostState {}

class CreatePostInitial extends CreatePostState {}

class CreatePostSuccess extends CreatePostState {}

class CreatePostLoading extends CreatePostState {}

class CreatePostFailure extends CreatePostState {
  final String errMessage;

  CreatePostFailure({required this.errMessage});
}

class CreatePostNotifier extends Notifier<CreatePostState> {
  @override
  CreatePostState build() {
    return CreatePostInitial();
  }

  Future<void> createPost({required String content, List<File>? media}) async {
    final provider = ref.read(createPostServiceProvider);
    state = CreatePostLoading();
    try {
      await provider.createPost(content: content, media: media);
      state = CreatePostSuccess();
    } on Exception catch (e) {
      if (e is DioException) {
        final message = e.response!.data;
        state = CreatePostFailure(errMessage: message[AppStrings.message]);
      }
    }
  }
}

final createPostProvider =
    NotifierProvider<CreatePostNotifier, CreatePostState>(
      CreatePostNotifier.new,
    );
