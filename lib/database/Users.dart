// To parse this JSON data, do
//
//     final users = usersFromMap(jsonString);


class Account {
  String? id;
  String? username;
  String? password;
  String? phonenumber;
  List<String>? favorite;
  String? email;
  String? sex;
  List<Schedule>? schedule;

  Account(
      {this.id,
        this.username,
        this.password,
        this.phonenumber,
        this.favorite,
        this.email,
        this.sex,
        this.schedule});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    phonenumber = json['phonenumber'];
    favorite = json['favorite'].cast<String>();
    email = json['email'];
    sex = json['sex'];
    if (json['schedule'] != null) {
      schedule = <Schedule>[];
      json['schedule'].forEach((v) {
        schedule!.add(new Schedule.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['phonenumber'] = this.phonenumber;

    data['favorite'] = this.favorite;
    data['email'] = this.email;
    data['sex'] = this.sex;
    if (this.schedule != null) {
      data['schedule'] = this.schedule!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Schedule {
  String? id;
  String? datetime;

  Schedule({this.id, this.datetime});

  Schedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    datetime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['datetime'] = this.datetime;
    return data;
  }
}






// class Users {
//   final int? usrId;
//   final String usrName;
//   final String usrPassword;
//
//   Users({
//     this.usrId,
//     required this.usrName,
//     required this.usrPassword,
//   });
//
//   factory Users.fromMap(Map<String, dynamic> json) => Users(
//     usrId: json["usrId"],
//     usrName: json["usrName"],
//     usrPassword: json["usrPassword"],
//   );
//
//   Map<String, dynamic> toMap() => {
//     "usrId": usrId,
//     "usrName": usrName,
//     "usrPassword": usrPassword,
//   };
// }
