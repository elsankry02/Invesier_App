import 'package:dio/dio.dart';
import 'package:invesier/core/constant/endpoints.dart';

class DeleteAccountService {
  final Dio dio;

  DeleteAccountService({required this.dio});

  Future<void> deleteAccount() async {
    await dio.delete(Endpoints.kDeleteAccount);
  }
}
