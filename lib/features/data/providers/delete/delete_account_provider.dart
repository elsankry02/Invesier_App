import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constant/app_strings.dart';
import '../provider.dart';

abstract class DeleteAccountState {}

class DeleteAccountInatial extends DeleteAccountState {}

class DeleteAccountLoading extends DeleteAccountState {}

class DeleteAccountFailure extends DeleteAccountState {
  final String errorMessage;

  DeleteAccountFailure({required this.errorMessage});
}

class DeleteAccountSuccess extends DeleteAccountState {}

class DeleteAccountNotifier extends Notifier<DeleteAccountState> {
  @override
  DeleteAccountState build() {
    return DeleteAccountInatial();
  }

  Future<void> deleteAccount() async {
    final provider = ref.read(deleteAccountServiceProvider);
    try {
      state = DeleteAccountLoading();
      await provider.deleteAccount();
      state = DeleteAccountSuccess();
    } on Exception catch (e) {
      if (e is DioException) {
        final message = e.response!.data;
        state = DeleteAccountFailure(errorMessage: message[AppStrings.message]);
      }
    }
  }
}

final deleteAccountProvider =
    NotifierProvider<DeleteAccountNotifier, DeleteAccountState>(
      DeleteAccountNotifier.new,
    );
