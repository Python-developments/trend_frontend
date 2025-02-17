import 'package:trend/data/models/core/location_model.dart';
import 'package:trend/third_parties_modules/abstract/i_module.dart';

abstract class ILiveLocationModule extends IModule{
  Future<(LocationModel,String?)?>  getCurrentLocation({required final bool gracefully});
}