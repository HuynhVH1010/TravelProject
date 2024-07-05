
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:travel/core/model/post.dart';
import 'package:travel/core/utils/app_account_controller.dart';
import 'package:travel/core/utils/app_location_controller.dart';
import 'package:travel/core/values/colors.dart';
import 'package:travel/pages/place_page.dart';
import 'package:travel/pages/search_page.dart';
// import 'package:travel/lib/core/model/post.dart';
// import 'package:travel/lib/core/utils/app_account_controller.dart';
// import 'package:travel/lib/core/utils/app_location_controller.dart';
// import 'package:travel/lib/pages/place_page.dart';
// import 'package:travel/lib/pages/search_page.dart';

class HistoryschedulePage extends StatelessWidget {
  HistoryschedulePage({super.key});
  final LocationController locationController = Get.put(LocationController());
  final AccountController accountController = Get.put(AccountController());
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "History Schedule",
          style: TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(SearchPage());
        },
        child: Icon(Icons.add),
      ),
      body: Obx(() => accountController.checklogin.value == true
          ? SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Obx(() {
                // accountController.getAccount(accountController.email.value);
                return Column(
                  children: [
                    ...accountController.schedule.map((schedule) {
                      final schedulePosts =
                          locationController.getPostsBySchedule([schedule]);
                      // Chuyển đổi chuỗi ngày từ JSON thành DateTime
                      DateTime scheduleDate = DateFormat('dd-MM-yyyy')
                          .parse('${schedule.datetime}');
                      int message = 0;
                      if (now.year == scheduleDate.year &&
                          now.month == scheduleDate.month &&
                          now.day == scheduleDate.day) {
                        message = 1;
                      } else if (now.isAfter(scheduleDate)) {
                        message = 0;
                      } else {
                        message = 2;
                      }
                      if (message == 0) {
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
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Date: ${schedule.datetime}"),
                                    ],
                                  ),
                                ),
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
                      }
                      return Container();
                    }).toList(),
                  ],
                );
              }),
            )
          : Center(
              child: Text("Please log in to continue this function"),
            )),
    );
  }
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
                              await accountController
                                  .getAccount(accountController.email.value);
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
