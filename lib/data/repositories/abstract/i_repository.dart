import 'dart:async';

import 'package:trend/core/utils/enums.dart';
import 'package:trend/core/utils/flavors.dart';
import 'package:trend/data/clients/abstract/i_http_client.dart';
import 'package:trend/data/errors/core_errors.dart';
import 'package:trend/data/errors/custom_error.dart';
import 'package:trend/data/errors/custom_error.dart';
import 'package:trend/data/errors/custom_error.dart';
import 'package:trend/data/errors/custom_error.dart';
import 'package:trend/data/errors/custom_error.dart';
import 'package:trend/data/errors/custom_error.dart';
import 'package:trend/data/local_database/databases/abstract/i_app_local_database.dart';
import 'package:trend/data/models/core/pagination_data_model.dart';
import 'package:trend/data/models/core/pagination_response_model.dart';
import 'package:trend/data/models/core/response_model.dart';
import 'package:trend/third_parties_modules/abstract/i_logger_module.dart';

bool emptyMapper(final Map<String, dynamic> data) => true;
abstract class IRepository {
  final Flavor appFlavor;
  final IHttpClient httpClient;
  final ILoggerModule logger;
  final IAppLocalDatabase appDatabase;
  IRepository(this.appFlavor,this.httpClient, this.appDatabase, this.logger);

  Future<ResponseModel> _get(
          {required final String url,
          required final Map<String, dynamic> parameters}) =>
      httpClient.sendRequest(
          requestType: RequestMethod.get, url: url, parameters: parameters);
  Future<T> getObject<T>(
      {required final String url,
      required final T Function(Map<String, dynamic>) mapper,
       final Map<String, dynamic>? parameters}) async {
    try {
    final Map<String, dynamic> data =
        (await _get(url: url, parameters: parameters??{})).data;
      return mapper(data);
    } catch (e) {
      if(appFlavor.showErrors|| e is CustomError) {
        rethrow;
      }
      throw SomethingWentWrongError();
    }
  }

  Future<List<T>> getList<T>(
      {required final String url,
      required final T Function(Map<String, dynamic>) mapper,
      required final Map<String, dynamic> parameters}) async {
    try {
    final ResponseModel response = await _get(url: url, parameters: parameters);
      final List<dynamic> data=response.data;
      return data.map((final e)=>mapper(e)).toList();
    } catch (e) {
      if(appFlavor.showErrors|| e is CustomError) {
        rethrow;
      }
      throw SomethingWentWrongError();
    }
  }

  Future<PaginationDataModel<T>> getPagination<T>(
      {required final String url,
      required final int page,
      required final int perPage,
      required final Map<String, dynamic> parameters,
      required final T Function(Map<String, dynamic>) mapper}) async {
    try {
    final PaginationResponseModel response = await _get(
            url: url,
            parameters: parameters..addAll({'page': page, 'limit': perPage}))
        as PaginationResponseModel;

      return  PaginationDataModel.fromPaginationResponse(response,mapper);
    } catch (e) {
      if(appFlavor.showErrors|| e is CustomError) {
        rethrow;
      }
      throw SomethingWentWrongError();
    }
  }

  Future<T> post<T>(
      {required final String url,
      required final Map<String, dynamic> parameters,
      required final T Function(Map<String, dynamic>) mapper,
      final bool isFormData = false}) async {
    try {
    final ResponseModel response = await httpClient.sendRequest(
        requestType: RequestMethod.post,
        url: url,
        parameters: parameters,
        isFormData: isFormData);

      return mapper(response.data);
    } catch (e) {
      if(appFlavor.showErrors|| e is CustomError) {
        rethrow;
      }
      throw SomethingWentWrongError();
    }
  }

  Future<T> patch<T>(
      {required final String url,
      required final Map<String, dynamic> parameters,
      required final T Function(Map<String, dynamic>) mapper}) async {
    try {
    final ResponseModel response = await httpClient.sendRequest(
        requestType: RequestMethod.patch,
        url: url,
        parameters: parameters,
        isFormData: false);

      return mapper(response.data);
    } catch (e) {
      if(appFlavor.showErrors|| e is CustomError) {
        rethrow;
      }
      throw SomethingWentWrongError();
    }
  }

  Future<T> put<T>(
      {required final String url,
      required final Map<String, dynamic> parameters,
      required final T Function(Map<String, dynamic>) mapper}) async {
    try {
    final ResponseModel response = await httpClient.sendRequest(
        requestType: RequestMethod.put,
        url: url,
        parameters: parameters,
        isFormData: false);
      return mapper(response.data);
    } catch (e) {
      if(appFlavor.showErrors|| e is CustomError) {
        rethrow;
      }
      throw SomethingWentWrongError();
    }
  }

  Future<void> deleteMethod(
          {required final String url,
          final Map<String, dynamic>? parameters}) =>
      httpClient.sendRequest(
          requestType: RequestMethod.delete,
          url: url,
          parameters: parameters ?? {});
}
