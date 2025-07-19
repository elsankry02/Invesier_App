import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/features/provider/provider.dart';

abstract class CreatPostState {}

class CreatPostInitial extends CreatPostState {}

class CreatPostSuccess extends CreatPostState {}

class CreatPostLoading extends CreatPostState {}

class CreatPostFailuer extends CreatPostState {
  final String errMassege;

  CreatPostFailuer({required this.errMassege});
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
      state = CreatPostFailuer(errMassege: e.toString());
    }
  }
}

final createPostProvider = NotifierProvider<CreatePostNotifier, CreatPostState>(
  () {
    return CreatePostNotifier();
  },
);
