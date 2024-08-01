import 'package:equatable/equatable.dart';
import 'package:flutter_recruitment_task/src/database/database_client.dart';
import 'package:flutter_recruitment_task/src/utils/enums.dart';
import 'package:sqflite/sqflite.dart';

final class GroupApi extends Equatable {
  const GroupApi({required DatabaseClient dbClient}) : _dbClient = dbClient;
  final DatabaseClient _dbClient;

  ///Get all groups from group table.
  Future<List<dynamic>> get() async {
    final db = await _dbClient.database;

    final List<dynamic> groups = await db.query(DatabaseTables.tableGroup.name);

    return groups;
  }

  ///Takes [group] parameter and insets to group table.
  Future<void> insert(Map<String, Object?> group) async {
    final db = await _dbClient.database;

    await db.insert(
      DatabaseTables.tableGroup.name,
      group,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  ///Takes [group] and [id] parameters, updates group on group table where group id equals [id].
  Future<void> update(Map<String, Object?> group, String id) async {
    final db = await _dbClient.database;

    await db.update(
      DatabaseTables.tableGroup.name,
      group,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  ///Takes [id] parameter and deletes group from group table where group id equals [id].
  Future<void> delete(String id) async {
    final db = await _dbClient.database;

    await db.delete(
      DatabaseTables.tableGroup.name,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  List<Object?> get props => [];
}
