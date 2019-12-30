import 'package:be_alive/models/contentInstance.dart';
import 'package:be_alive/repository/database_creator.dart';

/// Object used as database service.
/// 
/// ```
/// Future<List<ContentInstance>> dreams = RepositoryService.getAll('Dreams')
/// dreams == RepositoryService.getAllDreams()
/// ```
/// 
/// A [RepositoryService] contain helper methods:
/// * [getAll] to get all instance typed in argument.
///   - [getAllDreams],
///   - [getAllTargets],
///   - [getAllGoodDeals],
///   - [getAllMotivations]
/// * [add] to add new instance.
///   - [addDream],
///   - [addTarget],
///   - [addGoodDeal],
///   - [addMotivation]
/// * [delete] to delete instance.
/// * [update] to update instance.
/// * [countOf] to count instance records.
class RepositoryService {
  /// Returns [Future] [List] of [ContentInstance] of object specified in [instanceName].
  /// 
  /// The [instanceName] are one of [DatabaseCreator.instances]
  ///
  /// ```
  /// getAll('Dreams') == Future<List<ContentInstance>>
  /// ```
  static Future<List<ContentInstance>> getAll(String instanceName) async {
    final sql = '''SELECT * FROM ${DatabaseCreator.contentTable}
    WHERE ${DatabaseCreator.isDeleted} = 0 AND ${DatabaseCreator.instance} = "$instanceName"''';
    final data = await db.rawQuery(sql);
    List<ContentInstance> contentInstances = List();

    for (final node in data) {
      final _instance = ContentInstance.fromJson(node);
      contentInstances.add(_instance);
    }
    return contentInstances;
  }
  /// Returns [Future] [List] of dreams as [ContentInstance].
  /// ```
  /// getAllDreams() == Future<List<ContentInstance>>
  /// ```
  static Future<List<ContentInstance>> getAllDreams() async { return getAll(DatabaseCreator.dreamsInstance); }
  /// Returns [Future] [List] of targets as [ContentInstance].
  /// ```
  /// getAllTargets() == Future<List<ContentInstance>>
  /// ```
  static Future<List<ContentInstance>> getAllTargets() async { return getAll(DatabaseCreator.targetsInstance); }
  /// Returns [Future] [List] of good deals as [ContentInstance].
  /// ```
  /// getAllGoodDeals() == Future<List<ContentInstance>>
  /// ```
  static Future<List<ContentInstance>> getAllGoodDeals() async { return getAll(DatabaseCreator.goodDealsInstance); }
  /// Returns [Future] [List] of motivations as [ContentInstance].
  /// ```
  /// getAllMotivations() == Future<List<ContentInstance>>
  /// ```
  static Future<List<ContentInstance>> getAllMotivations() async { return getAll(DatabaseCreator.motivationsInstance); }

  /// Add new [ContentInstance.instance] as filled object [ContentInstance].
  ///
  /// ```
  /// ContantInstance dream = ContantInstance('Dreams');
  /// dream.name  // Add some fields
  /// RepositoryService.add(dream)
  /// ```
  static Future<void> add(ContentInstance contentInstance) async {
    final sql = '''INSERT INTO ${DatabaseCreator.contentTable}
    ( ${DatabaseCreator.instance},
      ${DatabaseCreator.tag},
      ${DatabaseCreator.date},
      ${DatabaseCreator.name},
      ${DatabaseCreator.info},
      ${DatabaseCreator.image},
      ${DatabaseCreator.status},
      ${DatabaseCreator.permissions},
      ${DatabaseCreator.isDeleted} ) VALUES (?,?,?,?,?,?,?,?,?)''';
    List<dynamic> params = [contentInstance.instance,
                            contentInstance.tag,
                            contentInstance.date,
                            contentInstance.name,
                            contentInstance.info,
                            contentInstance.image,
                            contentInstance.status,
                            contentInstance.permissions,
                            1];
    if (DatabaseCreator.instances.contains(contentInstance.instance)) {
      final result = await db.rawInsert(sql, params);
      DatabaseCreator.databaseLog('Add new ${DatabaseCreator.instance}', sql, null, result, params);
    } else {
      DatabaseCreator.databaseLog('Cannot add new ${DatabaseCreator.instance}: "instance" field must be some of ${DatabaseCreator.instances.join(', ')}"!',
                                  sql, null, 0, params);
    }
  }
  /// Add new dream filled as [ContentInstance].
  /// 
  /// ```
  /// RepositoryService.addDream(ContantInstance('Dreams'))
  /// ```
  static Future<void> addDream(ContentInstance dream) async {
    dream.instance = DatabaseCreator.dreamsInstance;
    return add(dream);
  }
  /// Add new target filled as [ContentInstance].
  /// 
  /// ```
  /// RepositoryService.addTarget(ContantInstance('Targets'))
  /// ```
  static Future<void> addTarget(ContentInstance target) async {
    target.instance = DatabaseCreator.targetsInstance;
    return add(target);
  }
  /// Add new good deal filled as [ContentInstance].
  /// 
  /// ```
  /// RepositoryService.addGoodDeal(ContantInstance('GoodDeals'))
  /// ```
  static Future<void> addGoodDeal(ContentInstance goodDeal) async {
    goodDeal.instance = DatabaseCreator.goodDealsInstance;
    return add(goodDeal);
  }
  /// Add new motivation filled as [ContentInstance].
  /// 
  /// ```
  /// RepositoryService.addMotivation(ContantInstance('Motivations'))
  /// ```
  static Future<void> addMotivation(ContentInstance motivation) async {
    motivation.instance = DatabaseCreator.motivationsInstance;
    return add(motivation);
  }

  /// Delete [ContentInstance] by their fields.
  ///
  /// ```
  /// dream = RepositoryService.getAll('Dreams');
  /// RepositoryService.delete(dream)
  /// ```
  static Future<void> delete(ContentInstance contentInstance) async {
    final sql = '''DELETE FROM ${DatabaseCreator.contentTable}
    WHERE ${contentInstance.id} = ?''';
    List<dynamic> params = [contentInstance.id];
    final result = await db.rawDelete(sql, params);
    DatabaseCreator.databaseLog('Delete "${contentInstance.name}" ${contentInstance.instance}', sql, null, result, params);
  }

  /// Update fields of [ContentInstance].
  ///
  /// ```
  /// dream = RepositoryService.getAll('Dreams')[0];
  /// dream.tag = 'new tag'
  /// RepositoryService.update(dream)
  /// ```
  static Future<void> update(ContentInstance contentInstance) async {
    final sql = '''UPDATE ${DatabaseCreator.contentTable}
    SET ${DatabaseCreator.instance} = ?,
        ${DatabaseCreator.tag} = ?,
        ${DatabaseCreator.date} = ?,
        ${DatabaseCreator.name} = ?,
        ${DatabaseCreator.info} = ?,
        ${DatabaseCreator.image} = ?,
        ${DatabaseCreator.status} = ?,
        ${DatabaseCreator.permissions} = ?
    WHERE ${DatabaseCreator.id} = ?''';
    List<dynamic> params = [contentInstance.instance,
                            contentInstance.tag,
                            contentInstance.date,
                            contentInstance.name,
                            contentInstance.info,
                            contentInstance.image,
                            contentInstance.status,
                            contentInstance.permissions,
                            contentInstance.id];
    final result = await db.rawUpdate(sql, params);
    DatabaseCreator.databaseLog('Update "${contentInstance.name}" ${contentInstance.instance}', sql, null, result, params);
  }

  /// Count of [instanceName].
  ///
  /// ```
  /// count = RepositoryService.countOf('Dreams');
  /// ```
  static Future<int> countOf(String instanceName) async {
    print('Read cout of $instanceName');
    final data = await db.rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.contentTable}
    WHERE ${DatabaseCreator.instance} = "$instanceName"''');
    int count = data[0].values.elementAt(0);
    int idForNewItem = count++;
    return idForNewItem;
  }
}
