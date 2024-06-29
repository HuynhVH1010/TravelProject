// import 'dart:ffi';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:travel/demo/RegisterScreen.dart';
//
// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     RxBool _showPass = true.obs;
//     //var _passInvalid = false;
//     TextEditingController _userController = TextEditingController();
//     TextEditingController _passController = TextEditingController();
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//
//             height: double.infinity,
//             width: double.infinity,
//             decoration: BoxDecoration(color: Colors.yellow),
//             child:  Text(
//                   'Explore & Trip',
//                   style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87),
//                 )),
//
//           Positioned(
//               bottom: 1,
//               left: 1,
//               right: 1,
//               top: 250,
//               child: Padding(
//                 padding: EdgeInsets.all(30),
//                 child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30
//                           // topRight: Radius.circular(30),
//                           // topLeft: Radius.circular(30),
//                           ),
//                       color: Colors.white70,
//                     ),
//                     height: 600,
//                     width: double.infinity,
//                     child: SingleChildScrollView(
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 18, right: 18, top: 40),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             TextField(
//                               decoration: InputDecoration(
//                                   suffixIcon:
//                                       Icon(Icons.account_circle_rounded),
//                                   label: Text(
//                                     'Tài khoản',
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.black),
//                                   )),
//                             ),
//                             Obx(() => TextField(
//                               obscureText: _showPass.value,
//                               decoration: InputDecoration(
//                                   suffixIcon: IconButton(onPressed: (){
//                                     _showPass.value = !_showPass.value;
//                                   },
//                                       icon: _showPass.value ? Icon(Icons.visibility_off) : Icon(Icons.visibility)
//                                   ),
//                                   label: Text(
//                                     'Mật khẩu',
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.black),
//                                   )
//                               ),
//                             ),
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Align(
//                               alignment: Alignment.centerRight,
//                               child: Text(
//                                 'Quên mật khẩu?',
//                                 style: TextStyle(
//                                     fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 50,
//                             ),
//                             Container(
//                                 child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                       backgroundColor: Colors.yellowAccent,
//                                       shape: StadiumBorder(),
//                                       padding: EdgeInsets.symmetric(horizontal: 90,vertical: 15)
//                                   ),
//                                   onPressed: () {
//                                     Get.to(RegisterScreen());
//                                   },
//                                   child: Text(
//                                     'Đăng nhập',
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.black87),
//                                   ),
//                                 )
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Container(
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.white,
//                                   shape: StadiumBorder(),
//                                   padding: EdgeInsets.symmetric(horizontal: 100,vertical: 15)
//                                 ),
//                                 onPressed: () {
//                                   Get.to(RegisterScreen());
//                                 },
//                                 child: Text(
//                                   'Đăng kí',
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black87),
//                                 ),
//                               )
//                             ),
//                             SizedBox(
//                               height: 60,
//                             ),
//                             Center(
//                                 child: Container(
//                               alignment: Alignment.center,
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Container(
//                                     height: 60,
//                                     width: 60,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                       color: Colors.white70,
//                                     ),
//                                     child: Icon(
//                                       Icons.facebook,
//                                       size: 40,
//                                     ),
//                                   ),
//                                   Container(
//                                     height: 60,
//                                     width: 60,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                       color: Colors.white70,
//                                     ),
//                                     child: Icon(
//                                       Icons.g_mobiledata,
//                                       size: 50,
//                                     ),
//                                   ),
//                                   Container(
//                                     height: 60,
//                                     width: 60,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                       color: Colors.white70,
//                                     ),
//                                     child: Icon(
//                                       Icons.photo_camera_outlined,
//                                       size: 40,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             )
//                             )
//                           ],
//                         ),
//                       ),
//                     )),
//               )),
//         ],
//       ),
//     );
//   }
// }
