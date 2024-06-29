import 'dart:convert';
// import 'package:exam/core/model/account.dart';
// import 'package:exam/core/model/post.dart';
// import 'package:exam/core/utils/app_account_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:travel/core/model/account.dart';
import 'package:travel/core/model/post.dart';
import 'package:travel/core/utils/app_account_controller.dart';

class NetworkRequest {
  // static const String url = 'https://jsonplaceholder.typicode.com/photos';
  // static const String url = 'https://fakestoreapi.com/products';

  static List<Post> parsePost(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Post> posts = list.map((model) => Post.fromJson(model)).toList();
    return posts;
  }

  static List<Account> parseAccount(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Account> accounts =
        list.map((model) => Account.fromJson(model)).toList();
    return accounts;
  }

  // static Future<List<Post>> fetchPosts({int page = 1}) async {
  //   final response = await http.get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     return compute(parsePost, response.body);
  //   } else if (response.statusCode == 404) {
  //     throw Exception("Not found");
  //   } else
  //     throw Exception('Can\'t get post');
  // }
}

class dataServices {
  List<Post> postFromJson(String str) =>
      List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));
  String postToJson(List<Post> data) =>
      json.encode(List<dynamic>.from(data.map((e) => e.toJson())));
  var url = Uri.parse('https://664784812bb946cf2f9e0700.mockapi.io/place');

  Future<List<Post>> getPosts() async {
    var response = await http.get(url);
    return postFromJson(response.body);
  }

  List<Account> accountFromJson(String str) =>
      List<Account>.from(json.decode(str).map((x) => Account.fromJson(x)));
  String accountToJson(List<Account> data) =>
      json.encode(List<dynamic>.from(data.map((e) => e.toJson())));
  var urlAccount =
      Uri.parse('https://664784812bb946cf2f9e0700.mockapi.io/user');

  Future<List<Account>> getAccounts() async {
    var response = await http.get(urlAccount);
    return accountFromJson(response.body);
  }

  Future<void> GetAccount(String userName) async {
    final AccountController accountController = Get.put(AccountController());
    try {
      final response = await http
          .get(Uri.parse('https://664784812bb946cf2f9e0700.mockapi.io/user'));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body) as List;
        var user = jsonResponse
            .map((item) => Account.fromJson(item))
            .firstWhere((user) => user.username == userName);

        accountController.id.value = user.id!;
        accountController.username.value = user.username!;
        accountController.sex.value = user.sex!;
        accountController.phonenumber.value = user.phonenumber!;
        accountController.favorite.value = user.favorite ?? [];
        accountController.schedule.value = user.schedule ?? [];
      } else {
        print("Failed to load users");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  //Xử lý user
  String AccountUrl = 'https://664784812bb946cf2f9e0700.mockapi.io/user';

  Future<void> UpdatePosts(String id, String title) async {
    var response = await http.put(
      Uri.parse(AccountUrl + "/" + id),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );

    if (response.statusCode == 200) {
      print('Update successful');
      return;
    } else {
      print('Failed to update post: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception("Failed to update post");
    }
  }

  Future<void> CreatePost(String id, String title, String description,
      String category, String location, String image) async {
    var post = Post(
      id: id,
      title: title,
      description: description,
      category: category,
      location: location,
      image: image,
      rating: Rating(rate: 0, count: 0),
    );
    var response = await http.post(
      Uri.parse(AccountUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(post.toJson()),
    );

    if (response.statusCode == 201) {
      print('Post created successfully');
      return;
    } else {
      print('Failed to create post: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception("Failed to create post");
    }
  }

  Future<void> addToFavorites(String userId, String favorite) async {
    var response = await http.get(Uri.parse(AccountUrl + "/" + userId));
    if (response.statusCode == 200) {
      var userData = jsonDecode(response.body);

      if (!userData['favorite'].contains(favorite)) {
        userData['favorite'].add(favorite);

        var updateResponse = await http.put(
          Uri.parse(AccountUrl + "/" + userId),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(userData),
        );

        if (updateResponse.statusCode == 200) {
          print('Added to favorites successfully');
          return;
        } else {
          print('Failed to update user: ${updateResponse.statusCode}');
          print('Response body: ${updateResponse.body}');
          throw Exception("Failed to update user");
        }
      } else {
        print('Post is already in favorites');
      }
    } else {
      print('Failed to retrieve user: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception("Failed to retrieve user");
    }
  }

  Future<void> removeFromFavorites(String userId, String favorite) async {
    var response = await http.get(Uri.parse(AccountUrl + "/" + userId));
    if (response.statusCode == 200) {
      var userData = jsonDecode(response.body);

      if (userData['favorite'].contains(favorite)) {
        userData['favorite'].remove(favorite);

        var updateResponse = await http.put(
          Uri.parse(AccountUrl + "/" + userId),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(userData),
        );

        if (updateResponse.statusCode == 200) {
          print('Removed from favorites successfully');
          return;
        } else {
          print('Failed to update user: ${updateResponse.statusCode}');
          print('Response body: ${updateResponse.body}');
          throw Exception("Failed to update user");
        }
      } else {
        print('Post is not in favorites');
      }
    } else {
      print('Failed to retrieve user: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception("Failed to retrieve user");
    }
  }

  Future<void> addToSchedule(
      String userId, String datetime, String localId) async {
    var response = await http.get(Uri.parse(AccountUrl + "/" + userId));
    if (response.statusCode == 200) {
      var userData = jsonDecode(response.body);

      bool scheduleExists = false;

      // Duyệt qua tất cả các lịch trình để kiểm tra xem đã tồn tại hay chưa
      for (var schedule in userData['schedule']) {
        if (schedule['datetime'] == datetime) {
          // Nếu lịch trình đã tồn tại và chưa chứa localId, thêm localId vào
          if (!schedule['id'].contains(localId)) {
            schedule['id'].add(localId);
            scheduleExists = true;
            break;
          } else {
            print('Local ID already in schedule for this datetime');
            return;
          }
        }
      }

      // Nếu không tìm thấy lịch trình nào với datetime đã cho, tạo lịch trình mới
      if (!scheduleExists) {
        userData['schedule'].add({
          'id': [localId],
          'datetime': datetime
        });
      }

      // Cập nhật lại thông tin người dùng trên server
      var updateResponse = await http.put(
        Uri.parse(AccountUrl + "/" + userId),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userData),
      );

      if (updateResponse.statusCode == 200) {
        print('Added to schedule successfully');
        return;
      } else {
        print('Failed to update user: ${updateResponse.statusCode}');
        print('Response body: ${updateResponse.body}');
        throw Exception("Failed to update user");
      }
    } else {
      print('Failed to retrieve user: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception("Failed to retrieve user");
    }
  }

  Future<void> removeFromSchedule(
      String userId, String datetime, String localId) async {
    var response = await http.get(Uri.parse(AccountUrl + "/" + userId));
    if (response.statusCode == 200) {
      var userData = jsonDecode(response.body);

      bool scheduleUpdated = false;

      // Duyệt qua tất cả các lịch trình để tìm và xóa localId
      for (var schedule in userData['schedule']) {
        if (schedule['datetime'] == datetime) {
          if (schedule['id'].contains(localId)) {
            schedule['id'].remove(localId);
            scheduleUpdated = true;

            // Nếu danh sách id rỗng, xóa luôn lịch trình đó
            if (schedule['id'].isEmpty) {
              userData['schedule'].remove(schedule);
            }

            break;
          } else {
            print('Local ID not found in schedule for this datetime');
            return;
          }
        }
      }

      if (!scheduleUpdated) {
        print('No schedule found for the given datetime');
        return;
      }

      // Cập nhật lại thông tin người dùng trên server
      var updateResponse = await http.put(
        Uri.parse(AccountUrl + "/" + userId),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userData),
      );

      if (updateResponse.statusCode == 200) {
        print('Removed from schedule successfully');
        return;
      } else {
        print('Failed to update user: ${updateResponse.statusCode}');
        print('Response body: ${updateResponse.body}');
        throw Exception("Failed to update user");
      }
    } else {
      print('Failed to retrieve user: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception("Failed to retrieve user");
    }
  }

  Future<void> CreateUser(String username, String password, String email,
      String phonenumber, String sex) async {
    var response = await http.post(
      Uri.parse(AccountUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
        'email': email,
        'phonenumber': phonenumber,
        'sex': sex,
      }),
    );

    if (response.statusCode == 201) {
      print('Account created successfully');
      return;
    } else {
      print('Failed to create Account: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception("Failed to create Account");
    }
  }
}
