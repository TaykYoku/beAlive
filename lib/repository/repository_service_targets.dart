// import 'package:beAlive/models/targets.dart';
// import 'package:beAlive/repository/database_creator.dart';

// class RepositoryServiceTargets {
//   static Future<List<Targets>> getAllTargets() async {
//     final sql = '''SELECT * FROM ${DatabaseCreator.targetsTable}
//     WHERE ${DatabaseCreator.isDeleted} = 0''';
//     final data = await db.rawQuery(sql);
//     List<Targets> targets = List();

//     for (final node in data) {
//       final target = Targets.fromJson(node);
//       targets.add(target);
//     }
//     return targets;
//   }

//   static Future<Targets> getTarget(int id) async {

//     final sql = '''SELECT * FROM ${DatabaseCreator.targetsTable}
//     WHERE ${DatabaseCreator.id} = ?''';

//     List<dynamic> params = [id];
//     final data = await db.rawQuery(sql, params);

//     final target = Targets.fromJson(data.first);
//     return target;
//   }

//   static Future<void> addTarget(Targets target) async {

//     final sql = '''INSERT INTO ${DatabaseCreator.targetsTable}
//     (
//       ${DatabaseCreator.id},
//       ${DatabaseCreator.name},
//       ${DatabaseCreator.info},
//       ${DatabaseCreator.isDeleted}
//     )
//     VALUES (?,?,?,?)''';
//     List<dynamic> params = [target.id, target.name, target.info, target.isDeleted ? 1 : 0];
//     final result = await db.rawInsert(sql, params);
//     DatabaseCreator.databaseLog('Add target', sql, null, result, params);
//   }

//   static Future<void> deleteTarget(Targets target) async {

//     final sql = '''UPDATE ${DatabaseCreator.targetsTable}
//     SET ${DatabaseCreator.isDeleted} = 1
//     WHERE ${DatabaseCreator.id} = ?
//     ''';

//     List<dynamic> params = [target.id];
//     final result = await db.rawUpdate(sql, params);

//     DatabaseCreator.databaseLog('Delete target', sql, null, result, params);
//   }

//   static Future<void> updateTarget(Targets target) async {

//     final sql = '''UPDATE ${DatabaseCreator.targetsTable}
//     SET ${DatabaseCreator.name} = ?
//     WHERE ${DatabaseCreator.id} = ?
//     ''';

//     List<dynamic> params = [target.name, target.id];
//     final result = await db.rawUpdate(sql, params);

//     DatabaseCreator.databaseLog('Update target', sql, null, result, params);
//   }

//   static Future<int> targetsCount() async {
//     final data = await db.rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.targetsTable}''');

//     int count = data[0].values.elementAt(0);
//     int idForNewItem = count++;
//     return idForNewItem;
//   }
// }
