import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/clients/abstract/i_http_client.dart';
import 'package:trend/data/errors/api_error.dart';
import 'package:trend/data/errors/core_errors.dart';
import 'package:trend/data/models/core/pagination_response_model.dart';
import 'package:trend/data/models/core/response_model.dart';

import 'package:trend/third_parties_modules/abstract/i_http_requestor_module.dart';
import 'package:trend/third_parties_modules/abstract/i_internet_connection_module.dart';

@Singleton(as: IHttpClient)
class HttpClient extends IHttpClient {
  final IHttpRequestorModule httpRequestorModule;
  final IInternetConnectionModule internetConnectionModule;

  HttpClient(this.httpRequestorModule, this.internetConnectionModule);

  @override
  Future<ResponseModel> sendRequest(
      {required final RequestMethod requestType,
      required final String url,
      required final Map<String, dynamic> parameters,
      final bool isFormData = false}) async {
    if (!internetConnectionModule.hasInternetConnection) {
      throw InternetConnectionError();
    }
    try {
      final Response response = await httpRequestorModule.request(url,
          parameters: parameters,
          isFormData: isFormData,
          requestType: requestType,
          userToken: userToken);

      return mapResponseToModel(response);
    } on DioException catch (e) {
      if (e.response == null) {
        throw ServerError();
      }

      if ((e.response?.statusCode ?? 0) >= 500 || e.response!.data is String) {
        throw ServerError();
      }
      final Map<String, dynamic> data = e.response!.data;
      throw ApiError.fromJson(data).customError;
    } on Exception {
      throw ServerError();
    }
  }

  ResponseModel mapResponseToModel(final Response response) {
    final Map<String, dynamic>? data = response.data;
    try {
      return PaginationResponseModel.fromJson(json: data?['data'] ?? {});
    } catch (_) {
      return ResponseModel(data: data?['data'] ?? {});
    }
  }
}
