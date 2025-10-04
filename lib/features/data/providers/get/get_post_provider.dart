import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constant/app_strings.dart';
import '../../models/get/get_post_model.dart';
import '../provider.dart';

abstract class GetPostState {}

class GetPostInitial extends GetPostState {}

class GetPostLoading extends GetPostState {}

class GetPostSuccess extends GetPostState {
  final GetPostModel getPost;

  GetPostSuccess({required this.getPost});
}

class GetPostFailure extends GetPostState {
  final String errmessage;

  GetPostFailure({required this.errmessage});
}

class GetPostNotifier extends Notifier<GetPostState> {
  @override
  GetPostState build() {
    return GetPostInitial();
  }

  Future<void> getPost({required int postId}) async {
    final provider = ref.read(getPostServiceProvider);
    state = GetPostLoading();

    try {
      final getPost = await provider.getPost(postId: postId);

      state = GetPostSuccess(getPost: getPost);
    } on Exception catch (e) {
      if (e is DioException) {
        final errmessage = e.response!.data;
        state = GetPostFailure(errmessage: errmessage[AppStrings.message]);
      }
    }
  }
}

final getPostProvider = NotifierProvider<GetPostNotifier, GetPostState>(
  GetPostNotifier.new,
);
