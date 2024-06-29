// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:travel/database/Users.dart';
//
// class DatabaseHelper {
//   final databaseName = "notes.db";
//   String users = "create table users (usrID INTEGER PRIMARY KEY AUTOINCREMENT, usrName TEXT UNIQUE, usrPassword TEXT)";
//
//   Future<Database> initDB() async {
//     final databasePath = await getDatabasesPath();
//     final path = join(databasePath, databaseName);
//
//     return openDatabase(path, version: 1, onCreate: (db, version) async {
//       await db.execute(users);
//     });
//   }
//
//   Future<bool> MyLogin(Account user) async {
//     final Database db = await initDB();
//
//     var result = await db.rawQuery(
//         "select * from users where usrName = '${user.username}' AND usrPassword = '${user.password}'");
//     if (result.isNotEmpty) {
//       return true;
//     } else {
//       return false;
//     }
//   }
//
//   Future<int> Register(Account user) async {
//     final Database db = await initDB();
//
//     return db.insert('users', user.toMap());
//   }
//
// }