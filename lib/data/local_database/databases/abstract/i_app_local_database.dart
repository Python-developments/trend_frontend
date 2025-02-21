import 'package:trend/data/local_database/entities/user_entity.dart';

abstract class IAppLocalDatabase {
  Future<void> clearUserCache();
  void close();

  Future<UserEntity?> getCurrentUser();

  Future<void> setToken({required final String newToken,required final int userId});

}
