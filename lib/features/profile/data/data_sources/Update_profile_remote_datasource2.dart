import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart' as path;
import 'package:trend/features/explore/data/models/remote/get_all_post_model.dart';
import 'package:trend/features/profile/data/models/profile_model.dart';
import 'package:trend/shared/const/app_links.dart';

import '../../../../main.dart';

class updateProfileRemoteDataSource {
  final Dio dio;

  updateProfileRemoteDataSource({required this.dio});

  Future<Response<dynamic>> updateBio(String userId, String bio) async {
    print(accessToken);
    String? tok = accessToken;

    final data = {
      "bio": bio,
    };
    print("--------------------------$userId");
    final response = await dio.put(
      "${ApiEndpoints.baseUrl}/profiles/${userId}/",
      data: FormData.fromMap(data),
      options: Options(
        headers: {'Authorization': 'Bearer $tok'},
      ),
    );
    print("${response.data}");
    return response;
  }

  Future<Response<dynamic>> updatefullname(String userId, String fullname) async {

    String? tok = accessToken;

    final data = {
      "full_name": fullname,
    };
    final response = await dio.put(
      "${ApiEndpoints.baseUrl}/profiles/${userId}/",
      data: FormData.fromMap(data),
      options: Options(
        headers: {'Authorization': 'Bearer $tok'},
      ),
    );

    return response;
  }

  Future<Response<dynamic>> updateAvatar(String userId, File image) async {
    String? tok = accessToken;

    String fileName;
    fileName = path.basename(image.path);

    final data = {"avatar": await MultipartFile.fromFile(image.path, filename: fileName)};
    final response = await dio.put(
      "${ApiEndpoints.baseUrl}/profiles/${userId}/",
      data: FormData.fromMap(data),
      options: Options(
        headers: {'Authorization': 'Bearer $tok'},
      ),
    );
    return response;
  }

  Future<Response<dynamic>> delete() async {
    String? tok = accessToken;
    final response = await dio.delete(
      "${ApiEndpoints.baseUrl}/auth/account/delete/",
      options: Options(
        headers: {'Authorization': 'Bearer $tok'},
      ),
    );

    return response;
  }

  Future<List<ProfileModel>> getBlockedUser() async {
    String? tok = accessToken;
    final response = await dio.get(
      "${ApiEndpoints.baseUrl}/profiles/blocked/",
      options: Options(
        headers: {'Authorization': 'Bearer $tok'},
      ),
    );

    List<ProfileModel> users = [];
    for (var element in response.data["results"]) {
      users.add(ProfileModel.fromJson(element));
    }

    return users;
  }

  Future<List<PostModel>> getPostForUserMethod(int id) async {
    String? tok = accessToken;
    final response = await dio.get(
      "${ApiEndpoints.baseUrl}/posts/${id}/posts/",
      options: Options(
        headers: {'Authorization': 'Bearer $tok'},
      ),
    );

    var data = response.data["results"];
    List<PostModel> posts = [];
    for (var element in data) {
      posts.add(PostModel.fromJson(element));
    }

    return posts;
  }
}
