// import 'package:exam/core/utils/app_account_controller.dart';
// import 'package:exam/core/utils/app_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel/core/utils/app_account_controller.dart';
import 'package:travel/core/utils/app_location_controller.dart';

class TestPage extends StatelessWidget {
  TestPage({super.key});

  final AccountController accountController = Get.put(AccountController());
  final LocationController locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => accountController.isLoading.value ||
                locationController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: accountController.accounts.length,
                itemBuilder: (context, index) {
                  final account = accountController.accounts[index];
                  final favoritePosts = locationController.posts
                      .where((post) =>
                          account.favorite?.contains(post.id) ?? false)
                      .toList();
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Username: ${account.username}'),
                          Text('Email: ${account.email}'),
                          Text('Phone number: ${account.phonenumber}'),
                          Text('Sex: ${account.sex}'),
                          Text('Favorites: ${account.favorite?.join(', ')}'),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: account.favorite!.map((e) {
                              return Text(e);
                            }).toList(),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: account.schedule!.map((schedule) {
                              return Text(
                                  'Schedule ID: ${schedule.id}, DateTime: ${schedule.datetime}');
                            }).toList(),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: favoritePosts.map((post) {
                              return Text('Matching Post ID: ${post.category}');
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
