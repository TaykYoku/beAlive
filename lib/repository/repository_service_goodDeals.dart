// import 'package:beAlive/models/goodDeals.dart';
// import 'package:beAlive/repository/database_creator.dart';

// class RepositoryServiceGoodDeals {
//   static Future<List<GoodDeals>> getAllGoodDeals() async {
//     final sql = '''SELECT * FROM ${DatabaseCreator.goodDealsTable}
//     WHERE ${DatabaseCreator.isDeleted} = 0''';
//     final data = await db.rawQuery(sql);
//     List<GoodDeals> goodDeals = List();

//     for (final node in data) {
//       final goodDeal = GoodDeals.fromJson(node);
//       goodDeals.add(goodDeal);
//     }
//     return goodDeals;
//   }

//   static Future<GoodDeals> getGoodDeal(int id) async {

//     final sql = '''SELECT * FROM ${DatabaseCreator.goodDealsTable}
//     WHERE ${DatabaseCreator.id} = ?''';

//     List<dynamic> params = [id];
//     final data = await db.rawQuery(sql, params);

//     final goodDeal = GoodDeals.fromJson(data.first);
//     return goodDeal;
//   }

//   static Future<void> addGoodDeal(GoodDeals goodDeal) async {

//     final sql = '''INSERT INTO ${DatabaseCreator.goodDealsTable}
//     (
//       ${DatabaseCreator.id},
//       ${DatabaseCreator.name},
//       ${DatabaseCreator.info},
//       ${DatabaseCreator.isDeleted}
//     )
//     VALUES (?,?,?,?)''';
//     List<dynamic> params = [goodDeal.id, goodDeal.name, goodDeal.info, goodDeal.isDeleted ? 1 : 0];
//     final result = await db.rawInsert(sql, params);
//     DatabaseCreator.databaseLog('Add good deal', sql, null, result, params);
//   }

//   static Future<void> deleteGoodDeal(GoodDeals goodDeal) async {

//     final sql = '''UPDATE ${DatabaseCreator.goodDealsTable}
//     SET ${DatabaseCreator.isDeleted} = 1
//     WHERE ${DatabaseCreator.id} = ?
//     ''';

//     List<dynamic> params = [goodDeal.id];
//     final result = await db.rawUpdate(sql, params);

//     DatabaseCreator.databaseLog('Delete good deal', sql, null, result, params);
//   }

//   static Future<void> updateGoodDeal(GoodDeals goodDeal) async {

//     final sql = '''UPDATE ${DatabaseCreator.goodDealsTable}
//     SET ${DatabaseCreator.name} = ?
//     WHERE ${DatabaseCreator.id} = ?
//     ''';

//     List<dynamic> params = [goodDeal.name, goodDeal.id];
//     final result = await db.rawUpdate(sql, params);

//     DatabaseCreator.databaseLog('Update good deal', sql, null, result, params);
//   }

//   static Future<int> goodDealsCount() async {
//     final data = await db.rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.goodDealsTable}''');

//     int count = data[0].values.elementAt(0);
//     int idForNewItem = count++;
//     return idForNewItem;
//   }
// }
