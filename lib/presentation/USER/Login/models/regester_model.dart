class AwnRegesterModel {
  String? errors;
  String? token;
  String? message;
  bool? status;
  UserData? data;
  AwnRegesterModel.fromJson(Map<String, dynamic> json) {
    errors = json['errors'];

    message = json['message'];
    data = (json['data'] != null ? UserData.fromJson(json["data"]) : null)!;
  }
}

class UserData {
  String? message;
  String? token;
  dynamic id;
  dynamic debt;
  dynamic unread_chats_count;
  dynamic id_number;
  String? city;
  String? region;
  String? avatar;
  dynamic unread_notificaitons_count;
  dynamic referral_count;
  dynamic referral_id;
  dynamic mobile_number;
  String? email;
  dynamic date_of_birth;
  dynamic is_active;
  dynamic is_verified;
  dynamic employee;
  String? work_entity_name;
  String? total_monthly_expenses;
  String? total_monthly_obligations;
  String? home;
  String? emarital_statusmployee;
  dynamic number_of_children;
  dynamic number_of_domestic_workers;
  String? english_name;
  String? arabic_name;

  UserData.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    id = json["id"];
    debt = json["debt"];

    unread_chats_count = json["unread_chats_count"];
    id_number = json["id_number"];
    city = json["city"];
    region = json["region"];
    avatar = json["avatar"];

    unread_notificaitons_count = json["unread_notificaitons_count"];

    referral_count = json["referral_count"];

    referral_id = json["referral_id"];

    mobile_number = json["mobile_number"];

    email = json["email"];

    date_of_birth = json["date_of_birth"];

    is_active = json["is_active"];

    is_verified = json["is_verified"];

    employee = json["employee"];

    work_entity_name = json["work_entity_name"];

    total_monthly_expenses = json["total_monthly_expenses"];

    total_monthly_obligations = json["total_monthly_obligations"];

    home = json["home"];

    emarital_statusmployee = json["emarital_statusmployee"];

    number_of_children = json["number_of_children"];

    number_of_domestic_workers = json["number_of_domestic_workers"];

    english_name = json["english_name"];

    arabic_name = json["arabic_name"];
  }
}
