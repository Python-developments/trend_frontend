import 'package:drift/drift.dart';
import 'package:trend/data/local_database/databases/concrete/app_local_database.dart';
import 'package:trend/data/local_database/entities/user_entity.dart';
import 'package:trend/data/local_database/tables/users.dart';
part 'users_dao.g.dart';

@DriftAccessor(tables: [Users])
class UsersDao extends DatabaseAccessor<AppLocalDatabase> with _$UsersDaoMixin {
  UsersDao(super.attachedDatabase);

  Future<UserEntity?> getCurrentUser() async {
    final User? result = await select(attachedDatabase.users).getSingleOrNull();
    return result != null ? UserEntity(token: result.token,id: result.id) : null;
  }

  Future<void> setToken({required final String newToken,required final int userId}) async {
    await _deleteUser();
    await into(attachedDatabase.users).insert(User(token: newToken,id:userId));
    return;
  }



  Future<void> _deleteUser() => attachedDatabase.users.deleteAll();
}
