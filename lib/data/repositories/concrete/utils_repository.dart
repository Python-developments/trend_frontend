
import 'package:injectable/injectable.dart';
import 'package:trend/data/repositories/abstract/i_utils_repository.dart';


@Singleton(as: IUtilsRepository)
class UtilsRepository extends IUtilsRepository {
  UtilsRepository(super.appFlavor,super.httpClient, super.appDatabase, super.logger);

}
