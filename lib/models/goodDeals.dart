import 'package:be_alive/repository/database_creator.dart';

class GoodDeals {
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
  
  GoodDeals(this.id, this.instance, this.name, this.image, this.info, this.tag, this.status, this.permissions, this.date, this.isDeleted);

  GoodDeals.fromJson(Map<String, dynamic> json) {
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
