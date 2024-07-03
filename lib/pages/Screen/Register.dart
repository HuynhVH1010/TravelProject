import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel/constant/Connect.dart';
import 'package:travel/data/service/Authcontroller.dart';
import 'package:travel/data/service/Connection.dart';
import 'package:travel/pages/Screen/LoginManlam.dart';
//import 'package:travel/database/sqlite.dart';
import 'package:travel/database/Users.dart';

import '../detail_place_page.dart';
//import 'package:travel/service/Connection.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Future<Account>? _futureAccount;
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _sex = TextEditingController();
  final _phonenumber = TextEditingController();
  //final _user = TextEditingController();
  //final _pass = TextEditingController();
  final _confirmPass = TextEditingController();
  final _key = GlobalKey<FormState>();
  //final _showPass = true;
  RxBool _showPass = true.obs;
  RxBool _showPassRe = true.obs;
  final controller = AuthController();
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
              margin: EdgeInsets.only(top: 100),
              alignment: Alignment.center,
              child: Text(
                "ĐĂNG KÍ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Form(
                key: _key,
                child: Container(
                  width: 370,
                  height: 680,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      //border: Border.all(width: 2, color: Colors.black)
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 13,
                      ),
                      SizedBox(height: 13),
                      Container(
                        width: 350,
                        child: TextFormField(
                          controller: _email,
                          decoration: InputDecoration(
                              suffixIcon: Icon(CupertinoIcons.mail_solid),
                              label: Text(
                                'Email',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              contentPadding: EdgeInsets.all(15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      width: 2,
                                      style: BorderStyle.solid,
                                      color: Colors.black))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Vui long nhập email";
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 13),
                      Container(
                        width: 350,
                        child: 
                          Obx(() => TextFormField(
                            obscureText: _showPass.value,
                            controller: _password,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      _showPass.value = !_showPass.value;
                                    },
                                    icon: _showPass.value
                                        ? Icon(Icons.visibility)
                                        : Icon(Icons.visibility_off)),
                                label: Text(
                                  'Mật khẩu',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                contentPadding: EdgeInsets.all(15),
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
                          ),)
                      ),
                      SizedBox(height: 13),
                      Container(
                        width: 350,
                        child: 
                          Obx(() => TextFormField(
                            obscureText: _showPassRe.value,
                            controller: _confirmPass,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      _showPassRe.value = !_showPassRe.value;
                                    },
                                    icon: _showPassRe.value
                                        ? Icon(Icons.visibility)
                                        : Icon(Icons.visibility_off)),
                                label: Text(
                                  'Nhập lại mật khẩu',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                contentPadding: EdgeInsets.all(15),
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
                                return "Vui lòng nhập lại mật khẩu";
                              };
                              if (_confirmPass != _password){
                                return "Mật khẩu không trùng nhau";
                              }
                            },
                          ),)
                      ),
                      SizedBox(height: 50),
                      Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellow,
                              shape: StadiumBorder(),
                              padding: EdgeInsets.symmetric(horizontal: 100,vertical: 15),
                          ),
                          onPressed: () async {
                            // setState(() {
                            //   _futureAccount = DataService().Register(
                            //       _username.text,
                            //       _password.text,
                            //       _email.text,
                            //       _phonenumber.text,
                            //       _sex.text);
                            // });

                              try {
                                await controller.RegiterUser(
                                        context: context,
                                        email: _email.text,
                                        password: _password.text)
                                    .then(
                                  (value) {

                                    Get.offAll(() => MyInformation());
                                  },
                                );
                              } catch (e) {
                                firebase_auth.signOut();

                              }

                          },

                          // onPressed: (){
                          //   if (_key.currentState!.validate()) {
                          //     final db = DatabaseHelper();
                          //     db
                          //         .Register(Account(username: _user.text, password: _pass.text))
                          //         .whenComplete(() {
                          //           Navigator.push(
                          //               context,
                          //               MaterialPageRoute(
                          //                   builder: (context) =>
                          //                       const MyLogin()));
                          //     });
                          //     showDialog(
                          //         context: context,
                          //         builder: (context) => AlertDialog(
                          //           title: Text('Đăng kí thành công :))'),
                          //           actions: [
                          //             Container(
                          //               child: ElevatedButton(
                          //
                          //                 onPressed: (){
                          //                   Get.to(MyLogin());
                          //                 },
                          //                 child: Text(
                          //                   'OK',
                          //                   style: TextStyle(
                          //                     fontWeight: FontWeight.bold,
                          //                     color: Colors.black,
                          //                   ),
                          //                 ),
                          //                 style: ElevatedButton.styleFrom(
                          //                     alignment: Alignment.center,
                          //                     backgroundColor: Colors.yellow,
                          //                     shape: StadiumBorder(),
                          //                     padding: EdgeInsets.symmetric(horizontal: 50,vertical: 15)
                          //                 ),
                          //               ),
                          //             ),
                          //           ],
                          //         )
                          //     );
                          //   }
                          //
                          // },
                          child: Text(
                              'Đăng kí',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                            ),
                          ),
                          // style: ElevatedButton.styleFrom(
                          //     backgroundColor: Colors.yellow,
                          //     shape: StadiumBorder(),
                          //     padding: EdgeInsets.symmetric(horizontal: 100,vertical: 15)
                          // ),
                          // onPressed: () {
                          //   Get.to(MyLogin());
                          // },
                          // child: Text(
                          //   'Đăng kí',
                          //   style: TextStyle(
                          //       fontSize: 20,
                          //       fontWeight: FontWeight.bold,
                          //       color: Colors.black87),
                          // ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white70,
                              shape: StadiumBorder(),
                              padding: EdgeInsets.symmetric(horizontal: 70,vertical: 15)
                          ),
                          onPressed: () {
                            Get.to(MyLogin());
                          },
                          child: Text(
                            'Đã có tài khoản',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                        ),
                      ),
                      SizedBox(height: 60),
                      Center(
                        child: Text(
                          'Đăng nhập bằng',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                          child: Container(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
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
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
