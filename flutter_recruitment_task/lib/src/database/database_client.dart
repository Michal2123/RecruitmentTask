import 'package:flutter_recruitment_task/src/utils/enums.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseClient {
  static final DatabaseClient instance = DatabaseClient._internal();

  static Database? _database;

  DatabaseClient._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'exam_database.db'),
      onCreate: (db, version) {
        Batch batch = db.batch();
        batch.execute(
          '''CREATE TABLE 
        ${DatabaseTables.person.name}(
        id TEXT PRIMARY KEY, 
        ${PersonFieldName.firstName.name} TEXT NOT NULL, 
        ${PersonFieldName.lastName.name} TEXT NOT NULL,
        ${PersonFieldName.birthDate.name} TEXT NOT NULL,
        ${PersonFieldName.zipCode.name} TEXT NOT NULL,
        ${PersonFieldName.city.name} TEXT NOT NULL,
        ${PersonFieldName.street.name} TEXT NOT NULL,
        ${PersonFieldName.personGroupList.name} TEXT NOT NULL
        )''',
        );
        batch.execute(
          '''CREATE TABLE 
        ${DatabaseTables.group.name}(
        id TEXT PRIMARY KEY, 
        ${GroupFieldName.groupName.name} TEXT NOT NULL, 
        ${GroupFieldName.groupMemberList.name} TEXT NOT NULL
        )''',
        );
        batch.commit();
      },
      version: 1,
    );
  }
}
