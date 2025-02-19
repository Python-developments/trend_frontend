import 'package:dio/dio.dart';

import 'package:trend/shared/const/app_links.dart';

class AuthenticationApi {
  final dio = Dio(BaseOptions(
    followRedirects: true, // Automatically follow redirects
    validateStatus: (final status) {
      return status! < 500; // Allow all status codes below 500
    },
  ));

  AuthenticationApi();



  Future<String> resetPassword(final String email) async {
    try {
      final response = await dio.post(
        ApiEndpoints.resetPassword,
        data: {'email': email},
      );
      return response.data['message'];
    } catch (e) {
      throw Exception('Failed to reset password: $e');
    }
  }
}
