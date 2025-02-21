import 'package:drift/drift.dart';

class Users extends Table {
  TextColumn get token => text()();
  IntColumn get id => integer()();
}
