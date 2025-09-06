import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/get_posts_model.dart';
import '../provider.dart';

abstract class GetPostsState {}

class GetPostsinital extends GetPostsState {}

class GetPostsLoading extends GetPostsState {}

class GetPostsSuccess extends GetPostsState {
  final GetPostsModel getPostsModel;

  GetPostsSuccess({required this.getPostsModel});
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
    try {
      state = GetPostsLoading();
      final posts = await provider.getPosts();
      state = GetPostsSuccess(getPostsModel: posts);
    } on Exception catch (e) {
      state = GetPostsFailure(errMessage: e.toString());
    }
  }
}

final getPostsProvider = NotifierProvider<GetPostsNotifier, GetPostsState>(
  GetPostsNotifier.new,
);
