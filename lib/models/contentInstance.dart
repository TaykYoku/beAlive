import 'package:be_alive/repository/database_creator.dart';

/// Object to collect content information.
/// 
/// The [ContentInstance] can be specified with added [ContentInstance.instance]
/// argument in constructor.
/// 
/// ```
/// ContentInstance dream = ContentInstance('Dream')
/// dream.name = 'Jupper'
/// ```
class ContentInstance {
  int id;
  String instance;
  bool isDeleted;
  String tag;
  String date;
  String name;
  String info;
  String image;
  String status;
  String permissions;

  /// C`tor
  ContentInstance(this.instance) {
    // FIXME: Here need to set else args to default
  }
  
  /// Return fields [List] of [ContentInstance] object.
  /// 
  /// ```
  /// fields() == List
  /// ```
  List fields() {
    return [this.id, this.instance, this.tag, this.date, this.info, this.name, this.image, this.status, this.permissions, this.isDeleted];
  }

  /// Fill [ContentInstance] object by fields from [Map] dictionary.
  /// 
  /// ```
  /// ContentInstance dream = ContentInstance('Dreams')
  /// dream.fromJson({'tag', 'my tag'})
  /// ```
  ContentInstance.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseCreator.id];
    this.instance = json[DatabaseCreator.instance];
    this.tag = json[DatabaseCreator.tag];
    this.date = json[DatabaseCreator.date];
    this.name = json[DatabaseCreator.name];
    this.info = json[DatabaseCreator.info];
    this.image = json[DatabaseCreator.image];
    this.status = json[DatabaseCreator.status];
    this.isDeleted = json[DatabaseCreator.isDeleted] == 1;
    this.permissions = json[DatabaseCreator.permissions];
  }
}
