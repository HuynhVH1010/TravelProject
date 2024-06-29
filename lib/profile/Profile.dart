import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel/profile/Information.dart';
import 'package:travel/pages/Screen/LoginManlam.dart';
import 'package:travel/demo/LoginScreen.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading:
          IconButton(
            onPressed: (){},
            icon: Icon(CupertinoIcons.left_chevron), color: Colors.black87,),
        backgroundColor: Colors.yellow,
        title:
          Text('Your Profile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87
            ),
        ),
        actions: [
          IconButton(onPressed: (){},
              icon: Icon(isDark? CupertinoIcons.moon : CupertinoIcons.sun_min),
              color: Colors.black87,)
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset('assets/images/img.png'),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Chào, Hiếu',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 20),
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
                tileColor: Colors.yellow,
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
                                  backgroundColor: Colors.yellow,
                                  shape: StadiumBorder(),
                                  padding: EdgeInsets.symmetric(horizontal: 50,vertical: 15)
                              ),
                            ),
                          ),
                        ],
                      )
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
                tileColor: Colors.yellow,
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
                tileColor: Colors.yellow,
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
                tileColor: Colors.yellow,
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
                                  backgroundColor: Colors.yellow
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
                                  backgroundColor: Colors.yellow
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
                tileColor: Colors.yellow,

              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     items: [
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.home_filled, color: Colors.black),
      //         backgroundColor: Colors.yellow,
      //         label: ""
      //       ),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.place_outlined, color: Colors.black),
      //           label: ""
      //       ),
      //       BottomNavigationBarItem(
      //           icon: Icon(CupertinoIcons.heart, color: Colors.black),
      //           label: ""
      //       ),
      //       BottomNavigationBarItem(
      //           icon: Icon(CupertinoIcons.person, color: Colors.black),
      //           label: ""
      //       ),
      //     ]
      // ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 3,
        backgroundColor: Colors.yellow,
        indicatorColor: Colors.white70,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home_filled),
              icon: Icon(Icons.home_outlined),
              label: '',
            ),
            NavigationDestination(
              selectedIcon: Icon(CupertinoIcons.placemark_fill),
              icon: Icon(CupertinoIcons.placemark),
              label: '',
            ),
            NavigationDestination(
              selectedIcon: Icon(CupertinoIcons.heart_fill),
              icon: Icon(CupertinoIcons.heart),
              label: '',
            ),
            NavigationDestination(
              selectedIcon: Icon(CupertinoIcons.person_fill),
              icon: Icon(CupertinoIcons.person),
              label: '',
            ),
          ]),

    );
    
  }
}
