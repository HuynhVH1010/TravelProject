// import 'package:exam/core/network/network_requestlocation.dart';
// import 'package:exam/core/utils/app_account_controller.dart';
// import 'package:exam/core/utils/app_location_controller.dart';
// import 'package:exam/core/values/colors.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:travel/core/utils/app_account_controller.dart';
import 'package:travel/core/utils/app_location_controller.dart';

class UserScreen extends StatefulWidget {
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final AccountController accountController = Get.put(AccountController());
  final LocationController locationController = Get.put(LocationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User Details'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  child: ElevatedButton(
                    onPressed: () async {
                      accountController.ChangeLogin();
                      await accountController.getAccount('minhthai123');
                    },
                    child: Text('Get User'),
                  ),
                ),
                // Obx(() {
                //   return Column(
                //     children: [
                //       Text("Username: ${accountController.username.value}"),
                //       Text(
                //           "Phonenumber: ${accountController.phonenumber.value}"),
                //       Text("ID: ${accountController.id.value}"),
                //       Text("Sex: ${accountController.sex.value}"),
                //       Text(
                //           "Favorite: ${accountController.favorite.join(", ")}"),
                //       Text("Schedule:"),
                //       ListView.builder(
                //         shrinkWrap: true,
                //         itemCount: accountController.schedule.length,
                //         itemBuilder: (context, index) {
                //           final schedule = accountController.schedule[index];
                //           return Container(
                //             decoration: BoxDecoration(
                //                 // color: Colors.red,
                //                 border:
                //                     Border.all(width: 1, color: Colors.black12),
                //                 borderRadius:
                //                     BorderRadius.all(Radius.circular(24))),
                //             // height: 300,
                //             width: double.infinity,
                //             child: Column(
                //               children: [
                //                 Container(
                //                   height: 60,
                //                   width: double.infinity,
                //                   decoration: BoxDecoration(
                //                     borderRadius: BorderRadius.only(
                //                         topLeft: Radius.circular(24),
                //                         topRight: Radius.circular(24)),
                //                     color: lich,
                //                   ),
                //                   child: Center(
                //                       child:
                //                           Text("Date: ${schedule.datetime}")),
                //                 ),
                //                 Obx(() {
                //                   final schedulePosts =
                //                       locationController.getPostsBySchedule(
                //                           accountController.schedule);
                //                   return schedulePosts.isEmpty
                //                       ? Text("No posts found for the schedule")
                //                       : Container(
                //                           height: 300,
                //                           child: ListView.builder(
                //                             itemCount: schedulePosts.length,
                //                             itemBuilder: (context, index) {
                //                               final post = schedulePosts[index];
                //                               return ListTile(
                //                                 leading: Image.network(
                //                                     post.image ?? ''),
                //                                 title: Text(
                //                                     post.title ?? 'No title'),
                //                                 subtitle: Text(
                //                                     post.description ??
                //                                         'No description'),
                //                               );
                //                             },
                //                           ),
                //                         );
                //                 }),
                //               ],
                //             ),
                //           );
                //         },
                //       ),
                //     ],
                //   );
                // }),
              ],
            ),
          ),
        ));
  }
}
