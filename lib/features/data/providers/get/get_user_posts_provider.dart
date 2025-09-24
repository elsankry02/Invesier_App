import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/constant/app_strings.dart';
import 'package:invesier/features/data/models/get/get_user_posts_model;.dart';
import 'package:invesier/features/data/providers/provider.dart';

abstract class GetUserPostsState {}

class GetUserPostsInitial extends GetUserPostsState {}

class GetUserPostsLoading extends GetUserPostsState {}

class GetUserPostsSuccess extends GetUserPostsState {
  final List<GetUserPostsModel> getUserPosts;

  GetUserPostsSuccess({required this.getUserPosts});
}

class GetUserPostsFailure extends GetUserPostsState {
  final String errMessage;

  GetUserPostsFailure({required this.errMessage});
}

class GetUserPostsNotifier extends Notifier<GetUserPostsState> {
  @override
  GetUserPostsState build() {
    return GetUserPostsInitial();
  }

  Future<void> getUserPosts({required String username}) async {
    final provider = ref.read(getUserPostsServiceProvider);
    state = GetUserPostsLoading();
    try {
      final getUserPosts = await provider.getUserPosts(username: username);
      state = GetUserPostsSuccess(getUserPosts: getUserPosts);
    } on Exception catch (e) {
      if (e is DioException) {
        final errmessage = e.response!.data;
        state = GetUserPostsFailure(errMessage: errmessage[AppStrings.message]);
      }
    }
  }
}

final getUserPostsProvider =
    NotifierProvider<GetUserPostsNotifier, GetUserPostsState>(
      GetUserPostsNotifier.new,
    );
