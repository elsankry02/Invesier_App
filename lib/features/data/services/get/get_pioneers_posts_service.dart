import 'package:dio/dio.dart';
import 'package:invesier/core/constant/endpoints.dart';
import 'package:invesier/features/data/models/get/get_pioneers_posts_model.dart';

class GetPioneersPostsService {
  final Dio dio;

  GetPioneersPostsService({required this.dio});
  Future<List<GetPioneersPostsModel>> getPioneersPosts({
    int perPage = 10,
    String? search,
    String? cursor,
    String? filter,
  }) async {
    final response = await dio.get(
      Endpoints.kGetPioneersPosts,
      queryParameters: {
        "per_page": perPage,
        if (search != null) "search": search,
        if (cursor != null) "cursor": cursor,
        if (filter != null) "filter": filter,
      },
    );
    final data = response.data as Map<String, dynamic>;
    final result = data["data"] as List<dynamic>;

    return result
        .map((e) => GetPioneersPostsModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
