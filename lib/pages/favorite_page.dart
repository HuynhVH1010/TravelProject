//import 'dart:ffi';

// import 'package:exam/core/utils/app_account_controller.dart';
// import 'package:exam/core/utils/app_location_controller.dart';
// import 'package:exam/pages/place_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:travel/core/utils/app_account_controller.dart';
import 'package:travel/core/utils/app_location_controller.dart';
import 'package:travel/pages/place_page.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  final AccountController accountController = Get.put(AccountController());
  final LocationController locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorite",
          style: TextStyle(fontSize: 30, color: Colors.red),
        ),
      ),
      body: Obx(
        () => accountController.checklogin.value == true
            ? Obx(() {
                final favoritePosts = locationController.posts.where((post) {
                  return accountController.isFavorite(post.id!);
                }).toList();
                return Container(
                  width: double.infinity,
                  child: GridView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: favoritePosts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // số cột bạn muốn hiển thị
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      mainAxisExtent: 230,
                    ),
                    itemBuilder: (context, index) {
                      final post = favoritePosts[index];

                      return GestureDetector(
                        onTap: () {
                          print("click test");
                          locationController.setLocation(post);
                          Get.to(MyPlane());
                        },
                        child: buildFavoriteCard(
                          post.image!,
                          post.title!,
                          post.location!,
                          post.rating?.rate?.toDouble() ?? 0.0,
                          accountController,
                          post.id!,
                        ),
                      );
                    },
                  ),
                );
              })
            : Center(child: Text('Please log in to perform this function.')),
      ),
    );
  }
}

Widget buildFavoriteCard(
  String image,
  String title,
  String location,
  double rating,
  AccountController accountController,
  String postId,
) {
  return Column(
    children: [
      Container(
        height: 230,
        child: Container(
          height: 230,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () async {
                    print('click favorite');
                    await accountController.removeFromFavorites(
                        "${accountController.id}", postId);
                    accountController.getAccount('minhthai123');
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
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
                    Row(
                      children: [
                        RatingBarIndicator(
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemSize: 18,
                          rating: rating,
                          itemBuilder: (context, index) => Icon(
                            Icons.star_outlined,
                            color: Colors.amber,
                          ),
                        ),
                        Text(
                          "$rating",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    ],
  );
}
