import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  Future<void> createPost({required String content}) async {
    final provider = ref.read(postServiceProvider);
    try {
      state = CreatPostLoading();
      await provider.createPost(content: content);
      state = CreatPostSuccess();
    } on Exception catch (e) {
      state = CreatPostFailure(errMessage: e.toString());
    }
  }
}

final createPostProvider = NotifierProvider<CreatePostNotifier, CreatPostState>(
  CreatePostNotifier.new,
);
