import 'package:equatable/equatable.dart';
import 'package:flutter_recruitment_task/src/database/database_client.dart';
import 'package:flutter_recruitment_task/src/utils/enums.dart';
import 'package:sqflite/sqflite.dart';

final class PersonApi extends Equatable {
  const PersonApi({required DatabaseClient dbClient}) : _dbClient = dbClient;
  final DatabaseClient _dbClient;

  Future<List<dynamic>> get() async {
    final db = await _dbClient.database;

    final List<dynamic> groups = await db.query(DatabaseTables.person.name);

    return groups;
  }

  Future<void> insert(Map<String, dynamic> person) async {
    final db = await _dbClient.database;

    await db.insert(
      DatabaseTables.person.name,
      person,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> update(Map<String, dynamic> person, String id) async {
    final db = await _dbClient.database;

    await db.update(
      DatabaseTables.person.name,
      person,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> delete(String id) async {
    final db = await _dbClient.database;

    await db.delete(
      DatabaseTables.person.name,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  List<Object?> get props => [];
}
