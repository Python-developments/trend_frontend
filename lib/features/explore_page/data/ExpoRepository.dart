import 'package:dio/dio.dart';
import 'package:trend/features/posts/data/models/post_model.dart';
import 'package:trend/shared/const/app_links.dart';
import 'package:trend/shared/utiles/dependancy_injection.dart';

class ExpoRepository {
  Future<List<PostModel>> getPostsByPageNumber({required int pageNumber}) async {
    final dio = getIt<Dio>();
    String url = '${ApiEndpoints.baseUrl}/posts/all-posts/';

    final response = await dio.get(
      url,
      queryParameters: {'page': pageNumber, 'page_size': 10},
    );
    if (response.statusCode == 200) {
      final data = response.data as Map<String, dynamic>;
      final results = data['results'] as List<dynamic>;

      return results.map((json) => PostModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch posts');
    }
  }
}
