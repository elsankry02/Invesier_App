import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/constant/app_strings.dart';

import '../../models/get_posts_model.dart';
import '../provider.dart';

abstract class GetPostsState {}

class GetPostsinital extends GetPostsState {}

class GetPostsLoading extends GetPostsState {}

class GetPostsSuccess extends GetPostsState {
  final List<Datum> data;

  GetPostsSuccess({required this.data});
}

class GetPostsFailure extends GetPostsState {
  final String errMessage;

  GetPostsFailure({required this.errMessage});
}

class GetPostsNotifier extends Notifier<GetPostsState> {
  @override
  GetPostsState build() {
    return GetPostsinital();
  }

  Future<void> getPosts() async {
    final provider = ref.read(getPostsServiceProvider);
    state = GetPostsLoading();
    try {
      final posts = await provider.getPosts();
      state = GetPostsSuccess(data: posts);
    } on Exception catch (e) {
      if (e is DioException) {
        final errMessage = e.response!.data;
        state = GetPostsFailure(errMessage: errMessage[AppStrings.message]);
      }
    }
  }
}

final getPostsProvider = NotifierProvider<GetPostsNotifier, GetPostsState>(
  GetPostsNotifier.new,
);
