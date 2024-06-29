import 'dart:convert';
// import 'package:exploreandtrip/Constant/Connect.dart';
// import 'package:exploreandtrip/Pages/InformationPlane.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:travel/database/Users.dart';
// import 'package:exploreandtrip/Models/Users.dart';

var url = "https://664784812bb946cf2f9e0700.mockapi.io/user";

class DataService {
  Future<Account> Register(String username, String password, String email,
      String phonenumber, String sex) async {
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
          'email': email.trim(),
          'phonenumber': phonenumber,
          'sex': sex
        }));

    if (response.statusCode == 200) {
      return Account.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to create Account');
    }
  }
}
