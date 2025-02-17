import 'package:drift/drift.dart';

class Users extends Table {
  TextColumn get token => text()();
  TextColumn get lastLocationString => text().nullable()();
  RealColumn get lastLocationLatitude => real()();
  RealColumn get lastLocationLongitude => real()();
  TextColumn get addressId => text().nullable()();
  TextColumn get addressTitle => text().nullable()();
  TextColumn get addressArea => text().nullable()();
  TextColumn get addressDescription => text().nullable()();
  TextColumn get addressAdditionalInfo => text().nullable()();
}
