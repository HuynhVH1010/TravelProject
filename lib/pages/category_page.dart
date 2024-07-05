
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:travel/core/model/post.dart';
import 'package:travel/core/utils/app_account_controller.dart';
import 'package:travel/core/utils/app_location_controller.dart';
import 'package:travel/core/values/colors.dart';
import 'package:travel/core/values/image.dart';
import 'package:travel/pages/place_page.dart';
// import 'package:travel/lib/core/model/post.dart';
// import 'package:travel/lib/core/utils/app_account_controller.dart';
// import 'package:travel/lib/core/utils/app_location_controller.dart';
// import 'package:travel/lib/pages/place_page.dart';
//
// import '../lib/core/values/colors.dart';

class CategoryPage extends StatefulWidget {
  String category;
  CategoryPage({required this.category});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final LocationController locationController = Get.put(LocationController());
  final AccountController accountController = Get.put(AccountController());

  late String category;

  // bool showResults = false;
  late final List<Map<String, dynamic>> categories;

  @override
  void initState() {
    super.initState();
    category = widget.category; // Initialize the category variable
    categories = [
      {
        'category': category,
        'title': 'All',
        'image': AppAssets.camping,
        'ontap': () {
          setState(() {
            category = 'All';
            showResults = true;
          });
          locationController.searchLocations(category);
        }
      },
      {
        'category': category,
        'title': 'Beach',
        'image': AppAssets.camping,
        'ontap': () {
          setState(() {
            category = 'Beach';
            showResults = true;
          });

          locationController.searchLocations(category);
        }
      },
      {
        'category': category,
        'title': 'Historical Sites',
        'image': AppAssets.camping,
        'ontap': () {
          setState(() {
            category = 'Historical Sites';
            showResults = true;
          });
          locationController.searchLocations(category);
        }
      },
      {
        'category': category,
        'title': 'Nature & Adventure',
        'image': AppAssets.camping,
        'ontap': () {
          setState(() {
            showResults = true;
            category = 'Nature & Adventure';
          });
          locationController.searchLocations(category);
        }
      },
    ];
    locationController.searchLocations(category);
  }

  bool showResults = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Popular',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  height: 54, // Chiều cao của ListView
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryItem(
                        categorie: category,
                        title: categories[index]['title'],
                        image: categories[index]['image'],
                        onTap: categories[index]['ontap'],
                      );
                    },
                  ),
                ),
                // category == 'All'
                //     ? Container(
                //         child: Column(
                //           children: List.generate(
                //             locationController.posts.length,
                //             (index) => buildLocationCardAll(
                //               index,
                //               locationController.posts[index].image!,
                //               locationController.posts[index].title!,
                //               locationController.posts[index].description!,
                //               locationController.posts[index].rating?.rate
                //                       ?.toDouble() ??
                //                   0.0,
                //             ),
                //           ),
                //         ),
                //       )
                showResults
                    ? Obx(() {
                        if (locationController.isLoading.value) {
                          return Center(child: CircularProgressIndicator());
                        } else if (locationController.searchResults.isEmpty &&
                            category != 'All') {
                          return Center(
                              child: Text('Không tìm thấy sản phẩm nào'));
                        } else {
                          return category == 'All'
                              ? Container(
                                  child: Column(
                                    children: List.generate(
                                      locationController.posts.length,
                                      (index) => buildLocationCardAll(
                                        index,
                                        locationController.posts[index].image!,
                                        locationController.posts[index].title!,
                                        locationController
                                            .posts[index].description!,
                                        locationController
                                                .posts[index].rating?.rate
                                                ?.toDouble() ??
                                            0.0,
                                      ),
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      locationController.searchResults.length,
                                  itemBuilder: (context, index) {
                                    final location =
                                        locationController.searchResults[index];
                                    return GestureDetector(
                                      onTap: () {
                                        print("Bấm vào thử");
                                        locationController
                                            .setLocation(location);
                                        Get.to(MyPlane());
                                      },
                                      child: buildLocationCard(
                                        location,
                                        location.image!,
                                        location.title!,
                                        location.description!,
                                        location.rating?.rate?.toDouble() ??
                                            0.0,
                                      ),
                                    );
                                  },
                                );
                        }
                      })
                    : SizedBox(),
              ],
            ),
          ),
        )
        // Padding(
        //   padding: const EdgeInsets.all(16.0),
        //   child: Column(
        //     children: [
        //       Container(
        //         height: 54, // Chiều cao của ListView
        //         child: ListView.builder(
        //           scrollDirection: Axis.horizontal,
        //           itemCount: categories.length,
        //           itemBuilder: (context, index) {
        //             return CategoryItem(
        //               categorie: category,
        //               title: categories[index]['title'],
        //               image: categories[index]['image'],
        //               onTap: categories[index]['ontap'],
        //             );
        //           },
        //         ),
        //       ),
        //       showResults
        //           ? Expanded(
        //               child: Obx(() {
        //                 if (locationController.isLoading.value) {
        //                   return Center(child: CircularProgressIndicator());
        //                 } else if (locationController.searchResults.isEmpty) {
        //                   return Center(child: Text('No products found'));
        //                 } else {
        //                   return ListView.builder(
        //                     padding: const EdgeInsets.all(16.0),
        //                     itemCount: locationController.searchResults.length,
        //                     scrollDirection: Axis.vertical,
        //                     itemBuilder: (context, index) {
        //                       final location =
        //                           locationController.searchResults[index];
        //                       return GestureDetector(
        //                         onTap: () {
        //                           print("click test");
        //                           locationController.setLocation(location);
        //                           Get.to(MyPlane());
        //                         },
        //                         child: buildLocationCard(
        //                           location,
        //                           location.image!,
        //                           location.title!,
        //                           location.description!,
        //                           location.rating?.rate?.toDouble() ?? 0.0,
        //                         ),
        //                       );
        //                     },
        //                   );
        //                 }
        //               }),
        //             )
        //           : Spacer(),
        //     ],
        //   ),
        // ),
        // resizeToAvoidBottomInset: false,
        );
  }
}

Widget buildLocationCard(
    Post post, String image, String title, String description, double rate) {
  final LocationController locationController = Get.put(LocationController());
  final AccountController accountController = Get.put(AccountController());
  bool isFav() {
    String userID = post.id!;
    return accountController.isFavorite(userID);
  }

  return Container(
    // margin: const EdgeInsets.symmetric(vertical: 8),
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
  );
}

class CategoryItem extends StatelessWidget {
  final String categorie;
  final String title;
  final String image;
  final VoidCallback? onTap;
  CategoryItem(
      {required this.categorie,
      required this.title,
      required this.image,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        border: categorie.trim().toLowerCase() == title.trim().toLowerCase()
            ? Border.all(width: 1, color: Colors.green)
            : Border.all(width: 1, color: fsearch),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
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

Widget buildLocationCardAll(
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
