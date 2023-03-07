class AwnLoginModel {
  late final String token;

  late final UserData data;
  AwnLoginModel.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null ? UserData.fromJson(json["data"]) : null)!;
  }
}

class UserData {
  late int id;
  late int debt;
  late int unread_chats_count;
  late int id_number;
  late String city;
  late String region;
  late String avatar;
  late int unread_notificaitons_count;
  late int referral_count;
  late String referral_id;
  late int mobile_number;
  late String email;
  late String date_of_birth;
  late int is_active;
  late int is_verified;
  late int employee;
  late String work_entity_name;
  late String total_monthly_expenses;
  late String total_monthly_obligations;
  late String home;
  late String emarital_statusmployee;
  late int number_of_children;
  late int number_of_domestic_workers;
  late String english_name;
  late String arabic_name;

  UserData.fromJson(Map<String, dynamic> json) {
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
