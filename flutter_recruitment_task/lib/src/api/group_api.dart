import 'package:equatable/equatable.dart';
import 'package:flutter_recruitment_task/src/database/database_client.dart';
import 'package:flutter_recruitment_task/src/utils/enums.dart';
import 'package:sqflite/sqflite.dart';

final class GroupApi extends Equatable {
  const GroupApi({required DatabaseClient dbClient}) : _dbClient = dbClient;
  final DatabaseClient _dbClient;

  Future<List<dynamic>> get() async {
    final db = await _dbClient.database;

    final List<dynamic> groups = await db.query(DatabaseTables.group.name);

    return groups;
  }

  Future<void> insert(Map<String, Object?> group) async {
    final db = await _dbClient.database;

    await db.insert(
      DatabaseTables.group.name,
      group,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> update(Map<String, Object?> group, String id) async {
    final db = await _dbClient.database;

    await db.update(
      DatabaseTables.group.name,
      group,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> delete(String id) async {
    final db = await _dbClient.database;

    await db.delete(
      DatabaseTables.group.name,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  List<Object?> get props => [];
}
