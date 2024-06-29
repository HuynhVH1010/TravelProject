//import 'dart:ffi';

// import 'package:exam/core/model/account.dart';
// import 'package:exam/core/model/post.dart';
// import 'package:exam/core/utils/app_account_controller.dart';
// import 'package:exam/core/utils/app_location_controller.dart';
// import 'package:exam/core/utils/app_utility.dart';
// import 'package:exam/core/values/image.dart';
// import 'package:exam/pages/detail_place_page.dart';
// import 'package:exam/pages/favorite_page.dart';
// import 'package:exam/pages/login.dart';
// import 'package:exam/pages/place_page.dart';
// import 'package:exam/pages/search_page.dart';
// import 'package:exam/pages/test.dart';
// import 'package:exam/pages/testlich.dart';
// import 'package:exam/pages/testthongtinaccount.dart';
//import 'dart:js_interop';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel/core/model/post.dart';
import 'package:travel/core/utils/app_account_controller.dart';
import 'package:travel/core/utils/app_controller.dart';
import 'package:travel/core/utils/app_location_controller.dart';
import 'package:travel/core/utils/app_utility.dart';
import 'package:travel/core/values/colors.dart';
import 'package:travel/core/values/image.dart';
import 'package:travel/data/service/app_setting.dart';
import 'package:travel/pages/Screen/LoginManlam.dart';
import 'package:travel/pages/Screen/Setting.dart';
import 'package:travel/pages/favorite_page.dart';
import 'package:travel/pages/place_page.dart';
import 'package:travel/pages/search_page.dart';
import 'package:travel/pages/test.dart';
import 'package:travel/pages/testthongtinaccount.dart';
import 'package:travel/profile/Information.dart';

import '../../core/utils/app_connection_controller.dart';
// import '../../core/utils/app_connection_controller.dart';
// import '../../core/utils/app_controller.dart';
// import '../../data/services/app_setting.dart';
// import '../../core/values/colors.dart';
// import '../testfavorite.dart';

class DashboardController extends FullLifeCycleController
    with FullLifeCycleMixin, GetSingleTickerProviderStateMixin {
  final appSetting = Get.find<AppSetting>();
  final appController = Get.find<AppController>();
  final LocationController location = Get.put(LocationController());
  final AccountController account = Get.put(AccountController());

  final tabIndex = 0.obs;
  late List<Widget> pages = [];
  late PageController pageController;
  late TabController tabController;
  final String assetName = 'assets/images/location.svg';
  // bool checkLogin = true;

  // Danh sách các category
  final List<Map<String, dynamic>> categories = [
    {'title': 'Category 1', 'image': AppAssets.camping},
    {'title': 'Category 2', 'image': AppAssets.camping},
    {'title': 'Category 3', 'image': AppAssets.camping},
    {'title': 'Category 4', 'image': AppAssets.camping},
    {'title': 'Category 5', 'image': AppAssets.camping},
  ];

  void changeTabIndex(int index) async {
    tabIndex.value = index;
    pageController.jumpToPage(tabIndex.value);
    tabController.animateTo(index);
  }

  void getCategory() {
    location.categoryLocations('beach');
  }

  @override
  void onInit() async {
    super.onInit();
    //
    pageController =
        PageController(initialPage: tabIndex.value, keepPage: true);
    pages = <Widget>[
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(
                                  'https://static.wikia.nocookie.net/naruto/images/b/bb/Itachi.png/revision/latest/scale-to-width-down/300?cb=20220214112531'),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Obx(
                            () => Container(
                              child: Text(
                                "${account.username}",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        child: InkWell(
                          onTap: () {},
                          child: Icon(Icons.notifications_none),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Container(
                    child: Text(
                      "Where do you want to explore today?",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  child: InkWell(
                      onTap: () {
                        Get.to(SearchPage());
                        print('search');
                      },
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            color: fsearch),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  child: Text(
                                'Search destination',
                                style: TextStyle(color: kGrayColor),
                              )),
                              Container(
                                child: Icon(Icons.search_sharp),
                              )
                            ],
                          ),
                        ),
                      )),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              "Choose Category",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            child: InkWell(
                              onTap: () {
                                Get.to(TestPage());
                              },
                              child: Text(
                                'See all',
                                style: TextStyle(color: kBgGuildItemColor),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 54, // Chiều cao của ListView
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryItem(
                        title: categories[index]['title'],
                        image: categories[index]['image'],
                      );
                    },
                  ),
                ),
                Obx(
                  () => account.checklogin.value == true
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Favorite Place',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(FavoritePage());
                                  },
                                  child: Text('Explore',
                                      style:
                                          TextStyle(color: kBgGuildItemColor)),
                                )
                              ],
                            ),
                          ),
                        )
                      : Container(),
                ),
                Obx(
                  () => account.checklogin.value == true
                      ? Obx(() {
                          final favoritePosts = location.posts.where((post) {
                            return account.isFavorite(post.id!);
                          }).toList();
                          return Container(
                            height: 230,
                            child: ListView.builder(
                              itemCount: favoritePosts.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final post = favoritePosts[index];

                                return GestureDetector(
                                  onTap: () {
                                    print("click test");
                                    location.setLocation(post);
                                    // Get.to(DashboardController());
                                    Get.to(MyPlane());
                                  },
                                  child: buildFavoriteCard(
                                    post.image!,
                                    post.title!,
                                    post.location!,
                                    post.rating?.rate?.toDouble() ?? 0.0,
                                  ),
                                );
                              },
                            ),
                          );
                        })
                      : Container(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Popular Package',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            print(location.posts.length);
                            // Get.to(TestPage());
                            // Get.to(FavoritePage());
                          },
                          child: Text("See All",
                              style: TextStyle(color: kBgGuildItemColor)),
                        )
                      ],
                    ),
                  ),
                ),
                Obx(() => Container(
                      child: Column(
                          children: List.generate(
                        location.posts.length,
                        (index) => buildLocationCard(
                            index,
                            location.posts[index].image!,
                            location.posts[index].title!,
                            location.posts[index].description!,
                            location.posts[index].rating?.rate?.toDouble() ??
                                0.0),
                      )),
                    ))
              ],
            ),
          ),
        ),
      ),
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.to(UserScreen());
                },
                child: Text('Get user')),
            ElevatedButton(
                onPressed: () {
                  account.addToFavorites('2', '2');
                },
                child: Text('add favorite')),
            ElevatedButton(
                onPressed: () {
                  account.removeFromFavorites('2', '2');
                },
                child: Text('remove favorite')),
            ElevatedButton(
                onPressed: () {
                  account.addToSchedule('2', '13-08-2024', '2');
                },
                child: Text('add schedule')),
            ElevatedButton(
                onPressed: () {
                  bool check = account.isIdInSchedule('3', "12-6-2024");
                  // account.isIdInSchedule('2');
                  print(check);
                },
                child: Text('check id schedule')),
            ElevatedButton(
                onPressed: () {
                  account.removeFromSchedule('1', "12-6-2024", "4");
                  // account.isIdInSchedule('2');
                  print('check remove');
                },
                child: Text('remove schedule')),
            ElevatedButton(
                onPressed: () {
                  account.CreateUser('123', '123', '123', '123', '123');
                },
                child: Text('CreateUsers 123')),
            ElevatedButton(
                onPressed: () {
                  Get.to(FavoritePage());
                },
                child: Text('favorite')),
            ElevatedButton(
                onPressed: () {
                  location.categoryLocations("beach");
                  // print("category: ${location.categoryLocations("beach")}");
                  print("categoryResult: ${location.categoryResults}");
                },
                child: Text('getCategory')),
            ElevatedButton(
                onPressed: () {
                  Get.to(Setting());
                },
                child: Text('Setting')),
          ],
        ),
        // color: Colors.red,
      ),
      // SingleChildScrollView(
      //     child: ElevatedButton(
      //   onPressed: () {
      //     Get.to(TestLich());
      //   },
      //   child: Text('data'),
      // )),
      Scaffold(
        appBar: AppBar(
          title: Text(
            "Schedule",
            style: TextStyle(fontSize: 30),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(SearchPage());
          },
          child: Icon(Icons.add),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Obx(() {
            account.checklogin.value == true
                ? account.getAccount('minhthai123')
                : Container();
            return Column(
              children: [
                ...account.schedule.map((schedule) {
                  final schedulePosts = location.getPostsBySchedule([schedule]);

                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black12),
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24)),
                            color: lich,
                          ),
                          child:
                              Center(child: Text("Date: ${schedule.datetime}")),
                        ),
                        Column(children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: schedulePosts.length,
                            itemBuilder: (context, index) {
                              final post = schedulePosts[index];
                              return BuildScheduleCard(
                                  post,
                                  post.image!,
                                  post.title!,
                                  post.description!,
                                  post.rating?.rate?.toDouble() ?? 0.0,
                                  "${schedule.datetime}",
                                  post.id!);
                            },
                          ),
                        ]),
                      ],
                    ),
                  );
                }).toList(),
              ],
            );
          }),
        ),
      ),


      //MyLogin(),
      // SingleChildScrollView(
      //   scrollDirection: Axis.vertical,
      //   child: Container(
      //     child: Column(
      //       children: [
      //         Column(
      //           children: [
      //             Text(
      //               'Setting',
      //               style: TextStyle(
      //                   fontSize: 30,
      //                   fontWeight: FontWeight.bold,
      //                   color: Colors.blue
      //               ),
      //             ),
      //             SizedBox(height: 20),
      //             ListTile(
      //               onTap: (){
      //                 Get.to(Information());
      //               },
      //               shape: OutlineInputBorder(
      //                   borderRadius: BorderRadius.circular(20)
      //               ),
      //               title: const Text('Thông tin người dùng',
      //                 style: TextStyle(
      //                     fontWeight: FontWeight.bold
      //                 ),
      //               ),
      //               subtitle: const Text('Huỳnh Văn Hiếu',
      //                 style: TextStyle(
      //                     color: Colors.black),
      //               ),
      //               leading: Icon(CupertinoIcons.person, color: Colors.black),
      //               trailing: Icon(Icons.arrow_forward, color: Colors.black),
      //               tileColor: Colors.white10,
      //               //tileColor: Colors.blue,
      //             ),
      //             const SizedBox(height: 30),
      //             ListTile(
      //               onTap: (){
      //                 AlertDialog(
      //                   title: Text('Hiện tại chưa có thông báo nào!'),
      //                   actions: [
      //                     Container(
      //                       child: ElevatedButton(
      //                         onPressed: (){
      //                           Get.to(DashboardController());
      //                           //Navigator.pop(context);
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
      //                 );
      //               },
      //               shape: OutlineInputBorder(
      //                   borderRadius: BorderRadius.circular(20)
      //               ),
      //               title: const Text('Thông báo',
      //                 style: TextStyle(
      //                     fontWeight: FontWeight.bold
      //                 ),
      //               ),
      //               subtitle: const Text('Chưa có thông báo',
      //                 style: TextStyle(
      //                     color: Colors.black),
      //               ),
      //               leading: Icon(CupertinoIcons.bell, color: Colors.black),
      //               trailing: Icon(Icons.arrow_forward, color: Colors.black),
      //               tileColor: Colors.white10,
      //             ),
      //             const SizedBox(height: 30),
      //             ListTile(
      //               shape: OutlineInputBorder(
      //                   borderRadius: BorderRadius.circular(20)
      //               ),
      //               title: const Text('FAQ',
      //                 style: TextStyle(
      //                     fontWeight: FontWeight.bold
      //                 ),
      //               ),
      //               leading: Icon(CupertinoIcons.chat_bubble_text, color: Colors.black),
      //               trailing: Icon(Icons.arrow_forward, color: Colors.black),
      //               tileColor: Colors.white10,
      //             ),
      //             const SizedBox(height: 30),
      //             ListTile(
      //               shape: OutlineInputBorder(
      //                   borderRadius: BorderRadius.circular(20)
      //               ),
      //               title: const Text('Ngôn ngữ',
      //                 style: TextStyle(
      //                     fontWeight: FontWeight.bold
      //                 ),
      //               ),
      //               subtitle: const Text('Tiếng Việt',
      //                 style: TextStyle(
      //                     color: Colors.black),
      //               ),
      //               leading: Icon(Icons.language, color: Colors.black),
      //               trailing: Icon(Icons.arrow_forward, color: Colors.black),
      //               tileColor: Colors.white10,
      //             ),
      //             const SizedBox(height: 30),
      //             ListTile(
      //               shape: OutlineInputBorder(
      //                   borderRadius: BorderRadius.circular(20)
      //               ),
      //               onTap: () {
      //                 AlertDialog(
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
      //                           Get.to(DashboardController());
      //                           //Navigator.pop(context);
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
      //                 );
      //               },
      //               title: const Text('Đăng xuất',
      //                 style: TextStyle(
      //                     fontWeight: FontWeight.bold
      //                 ),
      //               ),
      //               // subtitle: const Text('Chưa có thông báo',
      //               //   style: TextStyle(
      //               //       color: Colors.black),
      //               // ),
      //               leading: Icon(Icons.logout, color: Colors.black),
      //               trailing: Icon(Icons.arrow_forward, color: Colors.black),
      //               tileColor: Colors.white10,
      //
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),

      FavoritePage(),
      Setting(),
      // Container(
      //   padding: EdgeInsets.only(left: 15, top: 80, right: 15, bottom: 10),
      //   color: Colors.white10,
      //   child: SingleChildScrollView(
      //     scrollDirection: Axis.vertical,
      //     child: Column(
      //       children: [
      //         Text(
      //           'Setting',
      //           style: TextStyle(
      //               fontSize: 30,
      //               fontWeight: FontWeight.bold,
      //               color: Colors.blue
      //           ),
      //         ),
      //         SizedBox(height: 20),
      //         ListTile(
      //           onTap: (){
      //             Get.to(Information());
      //           },
      //           shape: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(20)
      //           ),
      //           title: const Text('Thông tin người dùng',
      //             style: TextStyle(
      //                 fontWeight: FontWeight.bold
      //             ),
      //           ),
      //           subtitle: const Text('Huỳnh Văn Hiếu',
      //             style: TextStyle(
      //                 color: Colors.black),
      //           ),
      //           leading: Icon(CupertinoIcons.person, color: Colors.black),
      //           trailing: Icon(Icons.arrow_forward, color: Colors.black),
      //           tileColor: Colors.white10,
      //           //tileColor: Colors.blue,
      //         ),
      //         const SizedBox(height: 30),
      //         ListTile(
      //           onTap: (){
      //             showDialog(
      //               context: context,
      //               builder: (context) => AlertDialog(
      //                 title: Text('Hiện tại chưa có thông báo nào!'),
      //                 actions: [
      //                   Container(
      //                     child: ElevatedButton(
      //                       onPressed: (){
      //                         Navigator.pop(context);
      //                       },
      //                       child: Text(
      //                         'OK',
      //                         style: TextStyle(
      //                           fontWeight: FontWeight.bold,
      //                           color: Colors.black,
      //                         ),
      //                       ),
      //                       style: ElevatedButton.styleFrom(
      //                           alignment: Alignment.center,
      //                           backgroundColor: Colors.lightBlueAccent,
      //                           shape: StadiumBorder(),
      //                           padding: EdgeInsets.symmetric(horizontal: 50,vertical: 15)
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             );
      //           },
      //           shape: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(20)
      //           ),
      //           title: const Text('Thông báo',
      //             style: TextStyle(
      //                 fontWeight: FontWeight.bold
      //             ),
      //           ),
      //           subtitle: const Text('Chưa có thông báo',
      //             style: TextStyle(
      //                 color: Colors.black),
      //           ),
      //           leading: Icon(CupertinoIcons.bell, color: Colors.black),
      //           trailing: Icon(Icons.arrow_forward, color: Colors.black),
      //           tileColor: Colors.white10,
      //         ),
      //         const SizedBox(height: 30),
      //         ListTile(
      //           shape: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(20)
      //           ),
      //           title: const Text('FAQ',
      //             style: TextStyle(
      //                 fontWeight: FontWeight.bold
      //             ),
      //           ),
      //           leading: Icon(CupertinoIcons.chat_bubble_text, color: Colors.black),
      //           trailing: Icon(Icons.arrow_forward, color: Colors.black),
      //           tileColor: Colors.white10,
      //         ),
      //         const SizedBox(height: 30),
      //         ListTile(
      //           shape: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(20)
      //           ),
      //           title: const Text('Ngôn ngữ',
      //             style: TextStyle(
      //                 fontWeight: FontWeight.bold
      //             ),
      //           ),
      //           subtitle: const Text('Tiếng Việt',
      //             style: TextStyle(
      //                 color: Colors.black),
      //           ),
      //           leading: Icon(Icons.language, color: Colors.black),
      //           trailing: Icon(Icons.arrow_forward, color: Colors.black),
      //           tileColor: Colors.white10,
      //         ),
      //         const SizedBox(height: 30),
      //         ListTile(
      //           shape: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(20)
      //           ),
      //           onTap: () {
      //             showDialog(
      //               context: context,
      //               builder:  (context) => AlertDialog(
      //                 title: Text('Bạn muốn đăng xuất?'),
      //                 actions: [
      //                   Container(
      //                     child: ElevatedButton(
      //                       onPressed: (){
      //                         Get.to(MyLogin());
      //                       },
      //                       child: Text(
      //                         'Xác nhận',
      //                         style: TextStyle(
      //                           fontWeight: FontWeight.bold,
      //                           color: Colors.black,
      //                         ),
      //                       ),
      //                       style: ElevatedButton.styleFrom(
      //                           backgroundColor: Colors.lightBlueAccent
      //                       ),
      //                     ),
      //                   ),
      //                   Container(
      //                     child: ElevatedButton(
      //                       onPressed: (){
      //                         Navigator.pop(context);
      //                       },
      //                       child: Text(
      //                         'Hủy',
      //                         style: TextStyle(
      //                           fontWeight: FontWeight.bold,
      //                           color: Colors.black,
      //                         ),
      //                       ),
      //                       style: ElevatedButton.styleFrom(
      //                           backgroundColor: Colors.lightBlueAccent
      //                       ),
      //                     ),
      //                   )
      //
      //                 ],
      //               ),
      //             );
      //           },
      //           title: const Text('Đăng xuất',
      //             style: TextStyle(
      //                 fontWeight: FontWeight.bold
      //             ),
      //           ),
      //           // subtitle: const Text('Chưa có thông báo',
      //           //   style: TextStyle(
      //           //       color: Colors.black),
      //           // ),
      //           leading: Icon(Icons.logout, color: Colors.black),
      //           trailing: Icon(Icons.arrow_forward, color: Colors.black),
      //           tileColor: Colors.white10,
      //
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    ];
    tabController = TabController(length: pages.length, vsync: this);
    //
    DefaultCacheManager().emptyCache();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  @override
  void onInactive() {
    //print('DashboardController - onInative called');
  }

  @override
  void onPaused() {
    //print('DashboardController - onPaused called');
  }

  @override
  void onResumed() async {
    bool isOnline = Get.find<AppConnectionController>().isOnline;
    if (!isOnline) {
      AppUtility.showSnack('No internet!', 'Check internet on your device');
    }
  }

  @override
  void onDetached() {}

  @override
  void onHidden() {}
}



class CategoryItem extends StatelessWidget {
  final String title;
  final String image;
  // late  VoidCallback onTap;
  CategoryItem({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: fsearch),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          print('object');
        },
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Image.asset(image),
          ],
        ),
      ),
    );
  }
}

Widget buildLocationCard(
    int index, String image, String title, String description, double rate) {
  final LocationController locationController = Get.put(LocationController());
  final AccountController accountController = Get.put(AccountController());
  bool isFav() {
    String userID = locationController.posts[index].id!;
    return accountController.isFavorite(userID);
  }

  return InkWell(
    onTap: () {
      Get.find<LocationController>()
          .setLocation(locationController.posts[index]);
      Get.to(MyPlane());
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black12),
          borderRadius: BorderRadius.all(Radius.circular(24))),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      height: 160,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            height: 140,
            width: 100,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Obx(() => accountController.checklogin == false
                              ? Icon(Icons.favorite_border)
                              : isFav() == true
                                  ? Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                  : Icon(Icons.favorite_border))
                        ],
                      ),
                      Row(
                        children: [
                          RatingBarIndicator(
                            itemCount: 5,
                            itemSize: 20,
                            rating: rate,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '$rate',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildFavoriteCard(
    String image, String title, String location, double rating) {
  return Column(
    children: [
      Container(
          height: 230,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 230,
                width: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                  ),
                                  Expanded(
                                    child: Text(
                                      location,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  RatingBarIndicator(
                                      direction: Axis.horizontal,
                                      itemCount: 5,
                                      itemSize: 18,
                                      rating: rating,
                                      itemBuilder: (context, index) => Icon(
                                            Icons.star_outlined,
                                            color: Colors.amber,
                                          )),
                                  Container(
                                    child: Text(
                                      "$rating",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
                )),
          ))
    ],
  );
}

Widget BuildScheduleCard(Post post, String image, String title,
    String description, double rate, String datetime, String localId) {
  final LocationController locationController = Get.put(LocationController());
  final AccountController accountController = Get.put(AccountController());

  return InkWell(
    onTap: () {
      locationController.setLocation(post);
      Get.to(MyPlane());
    },
    child: Container(
      padding: EdgeInsets.all(8),
      height: 160,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            height: 140,
            width: 100,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await accountController.removeFromSchedule(
                                  '${accountController.id}', datetime, localId);
                              // Refresh account data after removing item
                              await accountController.getAccount('minhthai123');
                            },
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          RatingBarIndicator(
                            itemCount: 5,
                            itemSize: 20,
                            rating: rate,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '$rate',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
