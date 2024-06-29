import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AppUtility {

  static showSnack(String title, String msg){
    const padding = 20.0;
    Get.snackbar(
      title, msg,
      colorText: Colors.white,
      backgroundColor: Colors.black54,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.only(left: padding, right: padding, bottom: padding),
    );
  }
}