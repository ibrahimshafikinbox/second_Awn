// class SupportModel {
//   Data? data;
//   SupportModel.fronJson(Map<String, dynamic> json) {
//     data = Data.fromJson(json["data"]);
//   }
// }

// class Data {
//   dynamic id;
//   String? message;
//   String? image;
//   dynamic User_id;
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json["id"];
//     message = json["message"];
//     image = json["image"];
//     id = json["id"];
//   }
// }

SupportModel? supportModel;

class SupportModel {
  late SupportDataModel data;
  SupportModel.fromJson(json) {
    final data = SupportModel.fromJson(json["data"]);
  }
}

class SupportDataModel {
  dynamic id;
  String? message;
  String? image;
  dynamic User_id;
  SupportDataModel.fromJson(json) {
    id = json["id"];
    message = json["message"];
    image = json["image"];
    User_id = json["User_id"];
  }
}
