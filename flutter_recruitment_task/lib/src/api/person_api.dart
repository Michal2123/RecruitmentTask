import 'package:equatable/equatable.dart';
import 'package:flutter_recruitment_task/src/database/database_client.dart';
import 'package:flutter_recruitment_task/src/utils/enums.dart';
import 'package:sqflite/sqflite.dart';

final class PersonApi extends Equatable {
  const PersonApi({required DatabaseClient dbClient}) : _dbClient = dbClient;
  final DatabaseClient _dbClient;

  ///Get all persons from person table.
  Future<List<dynamic>> get() async {
    final db = await _dbClient.database;

    final List<dynamic> groups =
        await db.query(DatabaseTables.tablePerson.name);

    return groups;
  }

  ///Takes [person] parameter and insert to person table.
  Future<void> insert(Map<String, dynamic> person) async {
    final db = await _dbClient.database;

    await db.insert(
      DatabaseTables.tablePerson.name,
      person,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  ///Takes [person] and [id] parameters and updates person on person table where person id equals [id]
  Future<void> update(Map<String, dynamic> person, String id) async {
    final db = await _dbClient.database;

    await db.update(
      DatabaseTables.tablePerson.name,
      person,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  ///Takes [id] parameter and delete person from person table where person id equal [id]
  Future<void> delete(String id) async {
    final db = await _dbClient.database;

    await db.delete(
      DatabaseTables.tablePerson.name,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  List<Object?> get props => [];
}
