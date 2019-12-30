// import 'package:beAlive/models/motivations.dart';
// import 'package:beAlive/repository/database_creator.dart';

// class RepositoryServiceMotivations {
//   static Future<List<Motivations>> getAllMotivations() async {
//     final sql = '''SELECT * FROM ${DatabaseCreator.motivationsTable}
//     WHERE ${DatabaseCreator.isDeleted} = 0''';
//     final data = await db.rawQuery(sql);
//     List<Motivations> motivations = List();

//     for (final node in data) {
//       final motivation = Motivations.fromJson(node);
//       motivations.add(motivation);
//     }
//     return motivations;
//   }

//   static Future<Motivations> getMotivation(int id) async {

//     final sql = '''SELECT * FROM ${DatabaseCreator.motivationsTable}
//     WHERE ${DatabaseCreator.id} = ?''';

//     List<dynamic> params = [id];
//     final data = await db.rawQuery(sql, params);

//     final motivation = Motivations.fromJson(data.first);
//     return motivation;
//   }

//   static Future<void> addMotivation(Motivations motivation) async {

//     final sql = '''INSERT INTO ${DatabaseCreator.motivationsTable}
//     (
//       ${DatabaseCreator.id},
//       ${DatabaseCreator.name},
//       ${DatabaseCreator.info},
//       ${DatabaseCreator.isDeleted}
//     )
//     VALUES (?,?,?,?)''';
//     List<dynamic> params = [motivation.id, motivation.name, motivation.info, motivation.isDeleted ? 1 : 0];
//     final result = await db.rawInsert(sql, params);
//     DatabaseCreator.databaseLog('Add motivation', sql, null, result, params);
//   }

//   static Future<void> deleteMotivation(Motivations motivation) async {

//     final sql = '''UPDATE ${DatabaseCreator.motivationsTable}
//     SET ${DatabaseCreator.isDeleted} = 1
//     WHERE ${DatabaseCreator.id} = ?
//     ''';

//     List<dynamic> params = [motivation.id];
//     final result = await db.rawUpdate(sql, params);

//     DatabaseCreator.databaseLog('Delete motivation', sql, null, result, params);
//   }

//   static Future<void> updateMotivation(Motivations motivation) async {

//     final sql = '''UPDATE ${DatabaseCreator.motivationsTable}
//     SET ${DatabaseCreator.name} = ?
//     WHERE ${DatabaseCreator.id} = ?
//     ''';

//     List<dynamic> params = [motivation.name, motivation.id];
//     final result = await db.rawUpdate(sql, params);

//     DatabaseCreator.databaseLog('Update motivation', sql, null, result, params);
//   }

//   static Future<int> motivationsCount() async {
//     final data = await db.rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.motivationsTable}''');

//     int count = data[0].values.elementAt(0);
//     int idForNewItem = count++;
//     return idForNewItem;
//   }
// }
