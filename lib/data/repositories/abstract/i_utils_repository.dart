import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/repositories/abstract/i_repository_impl.dart';

abstract class IUtilsRepository extends IRepository {
  IUtilsRepository(super.appFlavor,super.httpClient, super.appDatabase, super.logger,);

}
