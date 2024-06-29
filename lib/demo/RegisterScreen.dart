// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:travel/demo/LoginScreen.dart';
//
// class RegisterScreen extends StatelessWidget {
//
//   const RegisterScreen({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     RxBool _showPass = true.obs;
//     RxBool _showPassReturn = true.obs;
//     //var _passInvalid = false;
//     //var _passReturnInvalid = false;
//     TextEditingController _user = TextEditingController();
//     final _key = GlobalKey<FormState>();
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             height: double.infinity,
//             width: double.infinity,
//             decoration: BoxDecoration(color: Colors.yellow),
//             child: Padding(
//                 padding: const EdgeInsets.only(top: 200.0, left: 130),
//                 child: Text(
//                   ' ĐĂNG KÍ',
//                   style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87),
//                 )),
//           ),
//           Form(
//             key: _key,
//             child: Positioned(
//                 bottom: 10,
//                 left: 1,
//                 right: 1,
//                 top: 250,
//                 child: Padding(
//                   padding: EdgeInsets.all(30),
//                   child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30
//                           // topRight: Radius.circular(30),
//                           // topLeft: Radius.circular(30),
//                         ),
//                         color: Colors.white70,
//                       ),
//                       height: 600,
//                       width: double.infinity,
//                       child: SingleChildScrollView(
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 18, right: 18, top: 40),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               TextFormField(
//                                 controller: _user,
//                                 decoration: InputDecoration(
//                                     suffixIcon:
//                                     Icon(Icons.account_circle_rounded),
//                                     label: Text(
//                                       'Tên',
//                                       style: TextStyle(
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black),
//                                     ),
//
//                                 ),
//                                 validator: (value) {
//                                   if(value==null || value.isEmpty){
//                                     return "Vui long nhap ten";
//                                   }
//                                 },
//                               ),
//                               TextField(
//                                 decoration: InputDecoration(
//                                     suffixIcon:
//                                     Icon(Icons.mail),
//                                     label: Text(
//                                       'Email',
//                                       style: TextStyle(
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black),
//                                     )),
//                               ),
//                               Obx(() => TextField(
//                                 obscureText: _showPass.value,
//                                 decoration: InputDecoration(
//                                     suffixIcon: IconButton(onPressed: (){
//                                       _showPass.value = !_showPass.value;
//                                     },
//                                         icon: _showPass.value ? Icon(Icons.visibility_off) : Icon(Icons.visibility)
//                                     ),
//                                     label: Text(
//                                       'Mật khẩu',
//                                       style: TextStyle(
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black),
//                                     )
//                                 ),
//                               ),
//                               ),
//                               Obx(() => TextField(
//                                 obscureText: _showPassReturn.value,
//                                 decoration: InputDecoration(
//                                     suffixIcon: IconButton(onPressed: (){
//                                       _showPassReturn.value = !_showPassReturn.value;
//                                     },
//                                         icon: _showPassReturn.value ? Icon(Icons.visibility_off) : Icon(Icons.visibility)
//                                     ),
//                                     label: Text(
//                                       'Nhập lại mật khẩu',
//                                       style: TextStyle(
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black),
//                                     )
//                                 ),
//                               ),
//                               ),
//                               SizedBox(
//                                 height: 50,
//                               ),
//                               Container(
//                                 height: 50,
//                                 width: 300,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(30),
//                                     color: Colors.yellow),
//                                 child: Center(
//                                   child: Text(
//                                     'Đăng kí',
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.black87),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               Container(
//                                   child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                         backgroundColor: Colors.white10,
//                                         shape: StadiumBorder(),
//                                         padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15)
//                                     ),
//                                     onPressed: () {
//                                       if(_key.currentState!.validate()){
//                                         Get.to(LoginScreen());
//                                       }
//                                       else{
//
//                                       }
//                                     },
//                                     child: Text(
//                                       'Đã có tài khoản',
//                                       style: TextStyle(
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black87),
//                                     ),
//                                   )
//                               ),
//                               SizedBox(
//                                 height: 20,
//                               ),
//                               Center(
//                                   child: Container(
//                                     alignment: Alignment.center,
//                                     child: Row(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Container(
//                                           height: 60,
//                                           width: 60,
//                                           decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(20),
//                                             color: Colors.white70,
//                                           ),
//                                           child: Icon(
//                                             Icons.facebook,
//                                             size: 40,
//                                           ),
//                                         ),
//                                         Container(
//                                           height: 60,
//                                           width: 60,
//                                           decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(20),
//                                             color: Colors.white70,
//                                           ),
//                                           child: Icon(
//                                             Icons.g_mobiledata,
//                                             size: 50,
//                                           ),
//                                         ),
//                                         Container(
//                                           height: 60,
//                                           width: 60,
//                                           decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(20),
//                                             color: Colors.white70,
//                                           ),
//                                           child: Icon(
//                                             Icons.photo_camera_outlined,
//                                             size: 40,
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ))
//                             ],
//                           ),
//                         ),
//                       )),
//                 )),
//           ),
//         ],
//       ),
//     );
//   }
// }
