// import 'package:beAlive/models/dreams.dart';
// import 'package:beAlive/models/targets.dart';
// import 'package:beAlive/models/goodDeals.dart';
// import 'package:beAlive/models/motivations.dart';
// import 'package:beAlive/repository/database_creator.dart';

// class RepositoryService {
//   static Future<List> getAll(String table) async {
//     final sql = '''SELECT * FROM ${DatabaseCreator.dreamsTable}
//     WHERE ${DatabaseCreator.isDeleted} = 0''';
//     final data = await db.rawQuery(sql);
//     List<Dreams> dreams = List();

//     for (final node in data) {
//       final dream = Dreams.fromJson(node);
//       dreams.add(dream);
//     }
//     return dreams;
//   }

//   static Future<Dreams> getDream(int id) async {

//     final sql = '''SELECT * FROM ${DatabaseCreator.dreamsTable}
//     WHERE ${DatabaseCreator.id} = ?''';

//     List<dynamic> params = [id];
//     final data = await db.rawQuery(sql, params);

//     final dream = Dreams.fromJson(data.first);
//     return dream;
//   }

//   static Future<void> addDream(Dreams dream) async {

//     final sql = '''INSERT INTO ${DatabaseCreator.dreamsTable}
//     (
//       ${DatabaseCreator.id},
//       ${DatabaseCreator.name},
//       ${DatabaseCreator.info},
//       ${DatabaseCreator.isDeleted}
//     )
//     VALUES (?,?,?,?)''';
//     List<dynamic> params = [dream.id, dream.name, dream.info, dream.isDeleted ? 1 : 0];
//     final result = await db.rawInsert(sql, params);
//     DatabaseCreator.databaseLog('Add dream', sql, null, result, params);
//   }

//   static Future<void> deleteDream(Dreams dream) async {

//     final sql = '''UPDATE ${DatabaseCreator.dreamsTable}
//     SET ${DatabaseCreator.isDeleted} = 1
//     WHERE ${DatabaseCreator.id} = ?
//     ''';

//     List<dynamic> params = [dream.id];
//     final result = await db.rawUpdate(sql, params);

//     DatabaseCreator.databaseLog('Delete dream', sql, null, result, params);
//   }

//   static Future<void> updateDream(Dreams dream) async {

//     final sql = '''UPDATE ${DatabaseCreator.dreamsTable}
//     SET ${DatabaseCreator.name} = ?
//     WHERE ${DatabaseCreator.id} = ?
//     ''';

//     List<dynamic> params = [dream.name, dream.id];
//     final result = await db.rawUpdate(sql, params);

//     DatabaseCreator.databaseLog('Update dream', sql, null, result, params);
//   }

//   static Future<int> dreamsCount() async {
//     final data = await db.rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.dreamsTable}''');

//     int count = data[0].values.elementAt(0);
//     int idForNewItem = count++;
//     return idForNewItem;
//   }
// }
