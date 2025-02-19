import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:trend/data/local_database/daos/users_dao.dart';
import 'package:trend/data/local_database/databases/abstract/i_app_local_database.dart';
import 'package:trend/data/local_database/entities/user_entity.dart';
import 'package:trend/data/local_database/tables/users.dart';
import 'package:drift_flutter/drift_flutter.dart';
part 'app_local_database.g.dart';

@DriftDatabase(tables: [
  Users,
], daos: [
  UsersDao,
])
@Singleton(as: IAppLocalDatabase)
class AppLocalDatabase extends _$AppLocalDatabase implements IAppLocalDatabase {
  AppLocalDatabase() : super(driftDatabase(name: 'app_db'));
  AppLocalDatabase.test():super(NativeDatabase.memory());
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
          onUpgrade: (final migrator, final from, final to) async {
        await transaction(() async {
        });
      });

  @override
  Future<void> clearUserCache() => Future.wait([
      ]);


  @override
  Future<UserEntity?> getCurrentUser() => usersDao.getCurrentUser();
  @override
  Future<void> setToken(final String newToken) => usersDao.setToken(newToken);


}
