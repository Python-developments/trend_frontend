import 'package:trend/core/controllers/current_location_controller.dart';
import 'package:trend/data/models/core/pagination_data_model.dart';
import 'package:trend/data/repositories/abstract/i_repository.dart';

bool emptyMapper(final Map<String, dynamic> data) => true;

abstract class IRepositoryImpl extends IRepository {
  final CurrentLocationController currentLocationController;
  IRepositoryImpl(this.currentLocationController, super.appFlavor,super.httpClient,
      super.appDatabase, super.logger);

  Map<String, dynamic> _getLocationParams(final bool needLocation) =>
      !needLocation
          ? {}
          : {
              'latitude': currentLocationController
                  .userApplicationSurfingLocation.$1.latitude,
              'longitude': currentLocationController
                  .userApplicationSurfingLocation.$1.longitude,
            };
  Future<T> getObject<T>(
          {required final String url,
          required final T Function(Map<String, dynamic>) mapper,
          required final bool needLocation,
          final Map<String, dynamic>? parameters}) =>
      getObjectMethod(
          url: url,
          mapper: mapper,
          parameters: (parameters ?? {})
            ..addAll(_getLocationParams(needLocation)));
  Future<List<T>> getList<T>(
          {required final String url,
          required final T Function(Map<String, dynamic>) mapper,
          required final bool needLocation,
          final Map<String, dynamic>? parameters}) =>
      getListMethod(
          url: url,
          mapper: mapper,
          parameters: (parameters ?? {})
            ..addAll(_getLocationParams(needLocation)));
  Future<PaginationDataModel<T>> getPagination<T>(
          {required final String url,
          required final int page,
          required final int perPage,
          required final Map<String, dynamic> parameters,
          required final bool needLocation,
          required final T Function(Map<String, dynamic>) mapper}) =>
      getPaginationMethod(
          url: url,
          mapper: mapper,
          page: page,
          perPage: perPage,
          parameters: parameters..addAll(_getLocationParams(needLocation)));
  Future<T> post<T>(
          {required final String url,
          required final Map<String, dynamic> parameters,
          required final bool needLocation,
          required final T Function(Map<String, dynamic>) mapper,
          final bool isFormData = false}) =>
      postMethod(
          url: url,
          parameters: parameters..addAll(_getLocationParams(needLocation)),
          isFormData: isFormData,
          mapper: mapper);
  Future<T> patch<T>(
          {required final String url,
          required final Map<String, dynamic> parameters,
          required final bool needLocation,
          required final T Function(Map<String, dynamic>) mapper}) =>
      patchMethod(
        url: url,
        mapper: mapper,
        parameters: parameters..addAll(_getLocationParams(needLocation)),
      );

  Future<T> put<T>(
          {required final String url,
          required final Map<String, dynamic> parameters,
          required final bool needLocation,
          required final T Function(Map<String, dynamic>) mapper}) =>
      putMethod(
          url: url,
          parameters: parameters..addAll(_getLocationParams(needLocation)),
          mapper: mapper);
  Future<void> delete(
          {required final String url,
          required final bool needLocation,
          final Map<String, dynamic>? parameters}) =>
      deleteMethod(
          url: url,
          parameters: (parameters ?? {})
            ..addAll(_getLocationParams(needLocation)));
}
