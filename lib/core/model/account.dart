class Account {
  String? id;
  String? username;
  String? password;
  String? phonenumber;
  List<String>? favorite;
  String? email;
  String? sex;
  List<Schedule>? schedule;

  Account({
    this.id,
    this.username,
    this.password,
    this.phonenumber,
    this.favorite,
    this.email,
    this.sex,
    this.schedule,
  });

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    phonenumber = json['phonenumber'];
    favorite = List<String>.from(json['favorite']);
    email = json['email'];
    sex = json['sex'];
    if (json['schedule'] != null) {
      schedule = <Schedule>[];
      json['schedule'].forEach((v) {
        schedule!.add(Schedule.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['password'] = password;
    data['phonenumber'] = phonenumber;
    data['favorite'] = favorite;
    data['email'] = email;
    data['sex'] = sex;
    if (schedule != null) {
      data['schedule'] = schedule!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Schedule {
  List<String>? id;
  String? datetime;

  Schedule({this.id, this.datetime});

  Schedule.fromJson(Map<String, dynamic> json) {
    id = List<String>.from(json['id']);
    datetime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['datetime'] = datetime;
    return data;
  }
}
