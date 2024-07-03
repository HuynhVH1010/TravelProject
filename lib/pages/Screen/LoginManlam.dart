import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel/data/service/Authcontroller.dart';
import 'package:travel/pages/dashboard/dashboard_controller.dart';
import 'package:travel/pages/dashboard/dashboard_page.dart';
//import 'package:travel/service/Authcontroller.dart';
import 'package:travel/profile/Profile.dart';
import 'package:travel/pages/Screen/Register.dart';
import 'package:travel/demo/RegisterScreen.dart';
//import 'package:travel/database/sqlite.dart';
//import 'package:travel/database/Users.dart';
//import 'package:velocity_x/velocity_x.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  //final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();
  // final FirebaseDatabase _database = FirebaseDatabase.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var controller = Get.put(AuthController());
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _key = GlobalKey<FormState>();
  RxBool isVisible = false.obs;
  bool isLoginTrue = false;
  //final _showPass = true;
  //final db = DatabaseHelper();


  // void _signInWithEmailAndPassword() async {
  //   try {
  //     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  //       email: _user.text,
  //       password: _pass.text,
  //     );
  //     // Đăng nhập thành công, chuyển hướng đến màn hình chính
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DashboardPage()));
  //   } on FirebaseAuthException catch (e) {
  //     // Xử lý lỗi đăng nhập
  //     print(e.message);
  //   }
  // }
//////////////////////////
  // void _signInWithEmailAndPassword() async {
  //   try {
  //     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  //       email: _user.text,
  //       password: _pass.text,
  //     );
  //
  //     // Kiểm tra trong cơ sở dữ liệu
  //     DatabaseReference ref = _database.ref().child("users").child(userCredential.user!.uid);
  //     DataSnapshot snapshot = await ref.get();
  //
  //     if (snapshot.exists) {
  //       // Đăng nhập thành công, chuyển hướng đến màn hình chính
  //       Get.offAll(() => DashboardPage());
  //     } else {
  //       Get.snackbar('Error', 'Tài khoản không tồn tại trong cơ sở dữ liệu');
  //       await _auth.signOut();
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     // Xử lý lỗi đăng nhập
  //     Get.snackbar('Error', e.message ?? 'Đăng nhập thất bại');
  //   }
  // }


  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text.trim(),
          password: _password.text.trim());
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DashboardPage()));
      print("Đăng nhập thành công ");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // Get.defaultDialog(
        //   title: "GeeksforGeeks",
        //   middleText: "Hello world!",
        //   backgroundColor: Colors.green,
        //   titleStyle: TextStyle(color: Colors.white),
        //   middleTextStyle: TextStyle(color: Colors.white),
        // );
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Error"),
            content: Text("Invalid email or password. Please try again."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Đóng dialog
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  // MyLogin() async {
  //   var response = await db.MyLogin(Users(usrName: _user.text, usrPassword: _pass.text));
  //   if (response == true) {
  //     if (!mounted) return;
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Register()));
  //   }else {
  //     setState(() {
  //       isLoginTrue = true;
  //     });
  //   }
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 140),
              alignment: Alignment.center,
              child: Text(
                "EXPLORE & TRIP",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Form(
                key: _key,
                child: Container(
                  width: 370,
                  height: 600,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      //border: Border.all(width: 2, color: Colors.black)
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 350,
                          child: TextFormField(
                            controller: _email,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.account_circle_rounded),
                                label: Text(
                                  'Tên',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                contentPadding: EdgeInsets.all(8),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        width: 2,
                                        style: BorderStyle.solid,
                                        color: Colors.black
                                    )
                                )
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Vui lòng nhập tên";
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 25),
                        Container(
                          width: 350,
                          child:
                          Obx(() => TextFormField(
                            obscureText: isVisible.value,
                            controller: _password,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      isVisible.value =! isVisible.value;
                                    },
                                    icon: isVisible.value
                                        ? Icon(Icons.visibility)
                                        : Icon(Icons.visibility_off)),
                                label: Text(
                                  'Mật khẩu',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                contentPadding: EdgeInsets.all(8),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        width: 2,
                                        style: BorderStyle.solid,
                                        color: Colors.black))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Vui lòng nhập mật khẩu";
                              }
                            },
                          ),
                          )
                        ),
                        //SizedBox(height: 1),
                        Container(
                          padding: EdgeInsets.fromLTRB(190, 5, 5, 5),
                          child: TextButton(
                            onPressed: (){},
                            child: Text(
                              'Quên mật khẩu' ,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.blue,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: ElevatedButton(
                              onPressed: signIn,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow,
                                shape: StadiumBorder(),
                                padding: EdgeInsets.symmetric(horizontal: 90,vertical: 15)
                              ),
                            child: Text(
                                'Đăng nhập',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black87
                              ),
                            ),
                              ),

                          // ElevatedButton(
                          //   style: ElevatedButton.styleFrom(
                          //       backgroundColor: Colors.yellow,
                          //       shape: StadiumBorder(),
                          //       padding: EdgeInsets.symmetric(horizontal: 90,vertical: 15)
                          //   ),
                          //   onPressed:
                          //       () async {
                          //     await controller.LoginUser(context: context).then((value) {
                          //       if (value != null) {
                          //         //VxToast.show(context, msg: "Login Successfully");
                          //         Get.offAll(() => DashboardPage());
                          //         //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DashboardPage()));
                          //       } else {
                          //         showDialog(
                          //           barrierDismissible: false,
                          //           context: context,
                          //           builder: (context) => WillPopScope(
                          //             child: AlertDialog(
                          //               title: Text("Thông báo"),
                          //               content: Text("Email hoặc mật khẩu không đúng"),
                          //               actions: [
                          //                 Container(
                          //                   child: ElevatedButton(
                          //                     onPressed: (){
                          //                       Navigator.pop(context);
                          //                     },
                          //                     child: Text(
                          //                       'OK',
                          //                       style: TextStyle(
                          //                           color: Colors.black,
                          //                           fontWeight: FontWeight.bold
                          //                       ),
                          //                     ),
                          //                     style: ElevatedButton.styleFrom(
                          //                         backgroundColor: Colors.yellow
                          //                     ),
                          //                   ),
                          //                 )
                          //               ],
                          //             ),
                          //             onWillPop: () async => false,
                          //           ),
                          //         );
                          //       }
                          //     });
                          //   },
                          //   child: Text(
                          //     'Đăng nhập',
                          //     style: TextStyle(
                          //         fontSize: 20,
                          //         fontWeight: FontWeight.bold,
                          //         color: Colors.black87),
                          //   ),
                          // )


                        ),
                        SizedBox(height: 20),
                        Container(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white70,
                                shape: StadiumBorder(),
                                padding: EdgeInsets.symmetric(horizontal: 100,vertical: 15)
                            ),
                            onPressed: () {
                              Get.to(Register());
                            },
                            child: Text(
                              'Đăng kí',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        Center(
                          child: Text(
                            'Đăng nhập bằng',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                            child: Container(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white70,
                                    ),
                                    child: IconButton(
                                      iconSize: 45,
                                        onPressed: (){},
                                        icon: Icon(Icons.facebook),
                                    )
                                  ),
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white70,
                                    ),
                                    child: IconButton(
                                      iconSize: 50,
                                        onPressed: (){},
                                        icon: Icon(Icons.g_mobiledata)
                                    )
                                  ),
                                  Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white70,
                                    ),
                                    child: IconButton(
                                      iconSize: 45,
                                        onPressed: (){},
                                        icon: Icon(Icons.photo_camera_outlined)
                                    )
                                  )
                                ],
                              ),
                            )
                        ),
                        // Text(
                        //   'Tên đăng nhập hoặc mật khẩu không đúng',
                        //   style: TextStyle(color: Colors.red),
                        // )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
