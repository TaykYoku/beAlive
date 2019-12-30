import 'package:be_alive/repository/database_creator.dart';

class Dreams {
  int id;
  bool isDeleted;
  String tag;
  String name;
  String info;
  String image;
  String status;
  String permissions;
  
  Dreams(this.id, this.name, this.image, this.info, this.tag, this.status, this.permissions, this.isDeleted);

  Dreams.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseCreator.id];
    this.tag = json[DatabaseCreator.tag];
    this.name = json[DatabaseCreator.name];
    this.info = json[DatabaseCreator.info];
    this.image = json[DatabaseCreator.image];
    this.status = json[DatabaseCreator.status];
    this.isDeleted = json[DatabaseCreator.isDeleted] == 1;
    this.permissions = json[DatabaseCreator.permissions];
  }
}
