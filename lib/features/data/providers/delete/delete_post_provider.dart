import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:invesier/core/constant/app_strings.dart';
import 'package:invesier/features/data/providers/provider.dart';

abstract class DeletePostState {}

class DeletePostInitial extends DeletePostState {}

class DeletePostLoading extends DeletePostState {}

class DeletePostSuccess extends DeletePostState {}

class DeletePostFailure extends DeletePostState {
  final String errmessage;

  DeletePostFailure({required this.errmessage});
}

class DeletePostNotifier extends Notifier<DeletePostState> {
  @override
  DeletePostState build() {
    return DeletePostInitial();
  }

  Future<void> deletePost({required int id}) async {
    final provider = ref.read(deletePostServiceProvider);
    state = DeletePostLoading();
    try {
      await provider.deletePost(id: id);
      state = DeletePostSuccess();
    } on Exception catch (e) {
      if (e is DioException) {
        final errmessage = e.response!.data;
        state = DeletePostFailure(errmessage: errmessage[AppStrings.message]);
      }
    }
  }
}

final deletePostProvider =
    NotifierProvider<DeletePostNotifier, DeletePostState>(
      DeletePostNotifier.new,
    );
