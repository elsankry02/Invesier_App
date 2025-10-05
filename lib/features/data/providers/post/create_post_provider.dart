import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/constant/app_strings.dart';

import '../provider.dart';

abstract class CreatPostState {}

class CreatPostInitial extends CreatPostState {}

class CreatPostSuccess extends CreatPostState {}

class CreatPostLoading extends CreatPostState {}

class CreatPostFailure extends CreatPostState {
  final String errMessage;

  CreatPostFailure({required this.errMessage});
}

class CreatePostNotifier extends Notifier<CreatPostState> {
  @override
  CreatPostState build() {
    return CreatPostInitial();
  }

  Future<void> createPost({required String content, List<File>? media}) async {
    final provider = ref.read(postServiceProvider);
    state = CreatPostLoading();
    try {
      await provider.createPost(content: content, media: media);
      state = CreatPostSuccess();
    } on Exception catch (e) {
      if (e is DioException) {
        final message = e.response!.data;
        state = CreatPostFailure(errMessage: message[AppStrings.message]);
      }
    }
  }
}

final createPostProvider = NotifierProvider<CreatePostNotifier, CreatPostState>(
  CreatePostNotifier.new,
);
