import 'package:flutter/foundation.dart';

class NotificationModel {
  LinksModel? links;
  metaModel? meta;
  List<NotificationModel> data = [];
  NotificationModel({
    this.links,
    this.meta,
    required this.data,
  });
  factory NotificationModel.fromJson(Map<dynamic, dynamic> parsedjson) {
    return NotificationModel(
      links: parsedjson["links"],
      meta: parsedjson["meta"],
      data: parsedjson["data"],
    );
  }
}

class LinksModel {
  String? first;
  String? last;
  LinksModel.fromJson(Map<String, dynamic> json) {
    first = json["first"];
    last = json["last"];
  }
}

class metaModel {
  dynamic? current_page;
  dynamic? last_page;
  String? per_page;
  metaModel.fromJson(Map<String, dynamic> json) {
    current_page = json["current_page"];
    last_page = json["last_page"];
    per_page = json["per_page"];
  }
}
