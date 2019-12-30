import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:logging/logging.dart';

Database db;

/// Create and init database
/// 
///```
///await DatabaseCreator().initDatabase();
///```
class DatabaseCreator {
  final Logger log = new Logger('DatabaseCreator');

  static const dreamsInstance = 'Dreams';
  static const targetsInstance = 'Targets';
  static const goodDealsInstance = 'GoodDeals';
  static const motivationsInstance = 'Motivations';

  static const contentTable = 'Content';
  static const id = 'id';
  static const instance = 'instance';
  static const tag = 'tag';
  static const date = 'date';
  static const info = 'info';
  static const name = 'name';
  static const image = 'image';
  static const status = 'status';
  static const isDeleted = 'isDeleted';
  static const permissions = 'permissions';

  static const instances = [dreamsInstance, targetsInstance, goodDealsInstance, motivationsInstance];
  static const fields = [id, instance, tag, date, info, name, image, status, permissions, isDeleted];

  /// Create [contentTable] of database [db]
  Future<void> createContentTable(Database db) async {
      final sql = '''CREATE TABLE $contentTable
      ( $id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        $instance TEXT NOT NULL,
        $tag TEXT,
        $date TEXT,
        $name TEXT,
        $info TEXT,
        $image TEXT,
        $status TEXT,
        $isDeleted BIT NOT NULL,
        $permissions TEXT )''';
      print('Creating $contentTable table.');
      print(sql);
      await db.execute(sql);
    }

  /// Logging database actions
  static void databaseLog(String functionName, String sql,
      [List<Map<String, dynamic>> selectQueryResult, int insertAndUpdateQueryResult, List<dynamic> params]) {
    print(functionName);
    print(sql);
    if (params != null) {
      print(params);
    }
    if (selectQueryResult != null) {
      print(selectQueryResult);
    } else if (insertAndUpdateQueryResult != null) {
      print(insertAndUpdateQueryResult);
    }
  }

  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);
    //make sure the folder exists
    if (await Directory(dirname(path)).exists()) {
      //await deleteDatabase(path);
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  /// Initialization of 'beAlive_db' database
  Future<void> initDatabase() async {
    final path = await getDatabasePath('beAlive_db');
    print('Initialization DB: $path');
    db = await openDatabase(path, version: 1, onCreate: onCreate);
    print(db);
  }

  /// Call create table method
  Future<void> onCreate(Database db, int version) async {
    await createContentTable(db);
  }
}
