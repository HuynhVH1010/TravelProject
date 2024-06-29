// import 'package:exam/core/utils/app_account_controller.dart';
// import 'package:exam/core/utils/app_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:travel/core/utils/app_account_controller.dart';
import 'package:travel/core/utils/app_location_controller.dart';

class FavoriteTestPage extends StatefulWidget {
  FavoriteTestPage({super.key});

  @override
  State<FavoriteTestPage> createState() => _FavoriteTestPageState();
}

class _FavoriteTestPageState extends State<FavoriteTestPage> {
  final LocationController location = Get.find();
  final AccountController favoriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Locations'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Obx(() {
                final favoritePosts = location.posts.where((post) {
                  return favoriteController.isFavorite(post.id!);
                }).toList();

                return Container(
                  child: Column(
                    children: List.generate(
                      favoritePosts.length,
                      (index) {
                        final post = favoritePosts[index];
                        return buildFavoriteCard(
                          post.image!,
                          post.title!,
                          post.description!,
                          post.rating?.rate?.toDouble() ?? 0.0,
                          true,
                        );
                      },
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildFavoriteCard(
    String image, String title, String description, double rating, bool isFav) {
  return Container(
    // Định dạng của LocationCard
    decoration: BoxDecoration(
      border: Border.all(
        color: isFav
            ? Colors.red
            : Colors.grey, // Thay đổi màu viền nếu là favorite
      ),
    ),
    child: Column(
      children: [
        Image.network(image),
        Text(title),
        Text(description),
        Text(rating.toString()),
        if (isFav) Icon(Icons.favorite, color: Colors.red),
      ],
    ),
  );
}
