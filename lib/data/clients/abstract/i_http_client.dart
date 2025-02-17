import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/models/core/response_model.dart';

abstract class IHttpClient {
  IHttpClient();
  String userToken = '';

  Future<ResponseModel> sendRequest(
      {required final RequestMethod requestType,
      required final String url,
      required final Map<String, dynamic> parameters,
      final bool isFormData = false});

  void setToken(final String token) => userToken = token;
}
