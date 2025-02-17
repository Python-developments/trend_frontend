import 'package:dio/dio.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/third_parties_modules/abstract/i_module.dart';

abstract class IHttpRequestorModule extends IModule {
  Future<Response> request(final String url,
      {required final String userToken,
      required final RequestMethod requestType,
      required final Map<String, dynamic> parameters,
      required final bool isFormData});
}
