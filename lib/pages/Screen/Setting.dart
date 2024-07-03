import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:travel/core/utils/app_account_controller.dart';
import 'package:travel/core/utils/app_location_controller.dart';
import 'package:travel/pages/Screen/LoginManlam.dart';
import 'package:travel/pages/place_page.dart';
import 'package:travel/profile/Information.dart';

class Setting extends StatelessWidget {
  final AccountController accountController = Get.put(AccountController());
  final LocationController locationController = Get.put(LocationController());
  Setting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Obx(
    //     () =>
    //     accountController.checklogin.value == true
    //     ? Obx(() {
    //   final favoritePosts = locationController.posts.where((post) {
    //     return accountController.isFavorite(post.id!);
    //   }).toList();
    //   return
    //     Container(
    //     padding: EdgeInsets.only(left: 15, top: 80, right: 15, bottom: 10),
    //     color: Colors.white10,
    //     child: SingleChildScrollView(
    //       scrollDirection: Axis.vertical,
    //       child: Column(
    //         children: [
    //           Text(
    //             'Setting',
    //             style: TextStyle(
    //                 fontSize: 30,
    //                 fontWeight: FontWeight.bold,
    //                 color: Colors.blue
    //             ),
    //           ),
    //           SizedBox(height: 20),
    //           ListTile(
    //             onTap: (){
    //               Get.to(Information());
    //             },
    //             shape: OutlineInputBorder(
    //                 borderRadius: BorderRadius.circular(20)
    //             ),
    //             title: const Text('Thông tin người dùng',
    //               style: TextStyle(
    //                   fontWeight: FontWeight.bold
    //               ),
    //             ),
    //             subtitle: const Text('Huỳnh Văn Hiếu',
    //               style: TextStyle(
    //                   color: Colors.black),
    //             ),
    //             leading: Icon(CupertinoIcons.person, color: Colors.black),
    //             trailing: Icon(Icons.arrow_forward, color: Colors.black),
    //             tileColor: Colors.white10,
    //             //tileColor: Colors.blue,
    //           ),
    //           const SizedBox(height: 30),
    //           ListTile(
    //             onTap: (){
    //               showDialog(
    //                 context: context,
    //                 builder: (context) => AlertDialog(
    //                   title: Text('Hiện tại chưa có thông báo nào!'),
    //                   actions: [
    //                     Container(
    //                       child: ElevatedButton(
    //                         onPressed: (){
    //                           Navigator.pop(context);
    //                         },
    //                         child: Text(
    //                           'OK',
    //                           style: TextStyle(
    //                             fontWeight: FontWeight.bold,
    //                             color: Colors.black,
    //                           ),
    //                         ),
    //                         style: ElevatedButton.styleFrom(
    //                             alignment: Alignment.center,
    //                             backgroundColor: Colors.lightBlueAccent,
    //                             shape: StadiumBorder(),
    //                             padding: EdgeInsets.symmetric(horizontal: 50,vertical: 15)
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               );
    //             },
    //             shape: OutlineInputBorder(
    //                 borderRadius: BorderRadius.circular(20)
    //             ),
    //             title: const Text('Thông báo',
    //               style: TextStyle(
    //                   fontWeight: FontWeight.bold
    //               ),
    //             ),
    //             subtitle: const Text('Chưa có thông báo',
    //               style: TextStyle(
    //                   color: Colors.black),
    //             ),
    //             leading: Icon(CupertinoIcons.bell, color: Colors.black),
    //             trailing: Icon(Icons.arrow_forward, color: Colors.black),
    //             tileColor: Colors.white10,
    //           ),
    //           const SizedBox(height: 30),
    //           ListTile(
    //             shape: OutlineInputBorder(
    //                 borderRadius: BorderRadius.circular(20)
    //             ),
    //             title: const Text('FAQ',
    //               style: TextStyle(
    //                   fontWeight: FontWeight.bold
    //               ),
    //             ),
    //             leading: Icon(CupertinoIcons.chat_bubble_text, color: Colors.black),
    //             trailing: Icon(Icons.arrow_forward, color: Colors.black),
    //             tileColor: Colors.white10,
    //           ),
    //           const SizedBox(height: 30),
    //           ListTile(
    //             shape: OutlineInputBorder(
    //                 borderRadius: BorderRadius.circular(20)
    //             ),
    //             title: const Text('Ngôn ngữ',
    //               style: TextStyle(
    //                   fontWeight: FontWeight.bold
    //               ),
    //             ),
    //             subtitle: const Text('Tiếng Việt',
    //               style: TextStyle(
    //                   color: Colors.black),
    //             ),
    //             leading: Icon(Icons.language, color: Colors.black),
    //             trailing: Icon(Icons.arrow_forward, color: Colors.black),
    //             tileColor: Colors.white10,
    //           ),
    //           const SizedBox(height: 30),
    //           ListTile(
    //             shape: OutlineInputBorder(
    //                 borderRadius: BorderRadius.circular(20)
    //             ),
    //             onTap: () {
    //               showDialog(
    //                 context: context,
    //                 builder:  (context) => AlertDialog(
    //                   title: Text('Bạn muốn đăng xuất?'),
    //                   actions: [
    //                     Container(
    //                       child: ElevatedButton(
    //                         onPressed: (){
    //                           Get.to(MyLogin());
    //                         },
    //                         child: Text(
    //                           'Xác nhận',
    //                           style: TextStyle(
    //                             fontWeight: FontWeight.bold,
    //                             color: Colors.black,
    //                           ),
    //                         ),
    //                         style: ElevatedButton.styleFrom(
    //                             backgroundColor: Colors.lightBlueAccent
    //                         ),
    //                       ),
    //                     ),
    //                     Container(
    //                       child: ElevatedButton(
    //                         onPressed: (){
    //                           Navigator.pop(context);
    //                         },
    //                         child: Text(
    //                           'Hủy',
    //                           style: TextStyle(
    //                             fontWeight: FontWeight.bold,
    //                             color: Colors.black,
    //                           ),
    //                         ),
    //                         style: ElevatedButton.styleFrom(
    //                             backgroundColor: Colors.lightBlueAccent
    //                         ),
    //                       ),
    //                     )
    //
    //                   ],
    //                 ),
    //               );
    //             },
    //             title: const Text('Đăng xuất',
    //               style: TextStyle(
    //                   fontWeight: FontWeight.bold
    //               ),
    //             ),
    //             // subtitle: const Text('Chưa có thông báo',
    //             //   style: TextStyle(
    //             //       color: Colors.black),
    //             // ),
    //             leading: Icon(Icons.logout, color: Colors.black),
    //             trailing: Icon(Icons.arrow_forward, color: Colors.black),
    //             tileColor: Colors.white10,
    //
    //           ),
    //         ],
    //       ),
    //     ),
    //   );
    // })
    //         : Center(child: Text('Please log in to perform this function.')),
    // ),
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Setting",
          style: TextStyle(fontSize: 30, color: Colors.blue),
        ),
      ),
      body:
             Container(
              padding: EdgeInsets.only(left: 15, top: 80, right: 15, bottom: 10),
              color: Colors.white10,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    // Text(
                    //   'Setting',
                    //   style: TextStyle(
                    //       fontSize: 30,
                    //       fontWeight: FontWeight.bold,
                    //       color: Colors.blue
                    //   ),
                    // ),
                    SizedBox(height: 20),
                    ListTile(
                      onTap: (){
                        Get.to(Information());
                      },
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      title: const Text('Thông tin người dùng',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      subtitle: const Text('Huỳnh Văn Hiếu',
                        style: TextStyle(
                            color: Colors.black),
                      ),
                      leading: Icon(CupertinoIcons.person, color: Colors.black),
                      trailing: Icon(Icons.arrow_forward, color: Colors.black),
                      tileColor: Colors.white10,
                      //tileColor: Colors.blue,
                    ),
                    const SizedBox(height: 30),
                    ListTile(
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Hiện tại chưa có thông báo nào!'),
                            actions: [
                              Container(
                                child: ElevatedButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'OK',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      alignment: Alignment.center,
                                      backgroundColor: Colors.lightBlueAccent,
                                      shape: StadiumBorder(),
                                      padding: EdgeInsets.symmetric(horizontal: 50,vertical: 15)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      title: const Text('Thông báo',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      subtitle: const Text('Chưa có thông báo',
                        style: TextStyle(
                            color: Colors.black),
                      ),
                      leading: Icon(CupertinoIcons.bell, color: Colors.black),
                      trailing: Icon(Icons.arrow_forward, color: Colors.black),
                      tileColor: Colors.white10,
                    ),
                    const SizedBox(height: 30),
                    ListTile(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      title: const Text('FAQ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      leading: Icon(CupertinoIcons.chat_bubble_text, color: Colors.black),
                      trailing: Icon(Icons.arrow_forward, color: Colors.black),
                      tileColor: Colors.white10,
                    ),
                    const SizedBox(height: 30),
                    ListTile(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      title: const Text('Ngôn ngữ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      subtitle: const Text('Tiếng Việt',
                        style: TextStyle(
                            color: Colors.black),
                      ),
                      leading: Icon(Icons.language, color: Colors.black),
                      trailing: Icon(Icons.arrow_forward, color: Colors.black),
                      tileColor: Colors.white10,
                    ),
                    const SizedBox(height: 30),
                    ListTile(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder:  (context) => AlertDialog(
                            title: Text('Bạn muốn đăng xuất?'),
                            actions: [
                              Container(
                                child: ElevatedButton(
                                  onPressed: (){
                                    Get.to(MyLogin());
                                  },
                                  child: Text(
                                    'Xác nhận',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.lightBlueAccent
                                  ),
                                ),
                              ),
                              Container(
                                child: ElevatedButton(
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Hủy',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.lightBlueAccent
                                  ),
                                ),
                              )
        
                            ],
                          ),
                        );
                      },
                      title: const Text('Đăng xuất',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      // subtitle: const Text('Chưa có thông báo',
                      //   style: TextStyle(
                      //       color: Colors.black),
                      // ),
                      leading: Icon(Icons.logout, color: Colors.black),
                      trailing: Icon(Icons.arrow_forward, color: Colors.black),
                      tileColor: Colors.white10,
        
                    ),
                  ],
                ),
              ),
            )


    );
  }
}

// class Setting extends StatelessWidget {
//   Setting({super.key});
//
//   final AccountController accountController = Get.put(AccountController());
//   final LocationController locationController = Get.put(LocationController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Favorite",
//           style: TextStyle(fontSize: 30, color: Colors.red),
//         ),
//       ),
//       body: Obx(
//             () => accountController.checklogin.value == true
//             ? Obx(() {
//           final favoritePosts = locationController.posts.where((post) {
//             return accountController.isFavorite(post.id!);
//           }).toList();
//           return Container(
//             width: double.infinity,
//             child: GridView.builder(
//               padding: EdgeInsets.all(10),
//               itemCount: favoritePosts.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2, // số cột bạn muốn hiển thị
//                 mainAxisSpacing: 8.0,
//                 crossAxisSpacing: 8.0,
//                 mainAxisExtent: 230,
//               ),
//               itemBuilder: (context, index) {
//                 final post = favoritePosts[index];
//
//                 return GestureDetector(
//                   onTap: () {
//                     print("click test");
//                     locationController.setLocation(post);
//                     Get.to(MyPlane());
//                   },
//                   // child: buildFavoriteCard(
//                   //   post.image!,
//                   //   post.title!,
//                   //   post.location!,
//                   //   post.rating?.rate?.toDouble() ?? 0.0,
//                   //   accountController,
//                   //   post.id!,
//                   // ),
//                 );
//               },
//             ),
//           );
//         })
//             : Center(child: Text('Please log in to perform this function.')),
//       ),
//     );
//   }
// }