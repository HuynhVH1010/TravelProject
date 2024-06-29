import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class AppThemeController extends GetxController {
  final _storage = GetStorage();
  final _kDarkMode = 'kDarkMode';
  late ThemeMode appThemeMode = ThemeMode.dark;
  //

  @override
  void onInit() {
    bool isDarkMode = checkDarkMode();
    appThemeMode = isDarkMode?ThemeMode.dark:ThemeMode.light;
    //
    super.onInit();
  }

  bool checkDarkMode() => _storage.read(_kDarkMode)??false;

  /**
   * For theme
   */
  void saveTheme(bool isDarkMode){
    _storage.write(_kDarkMode, isDarkMode);
  }

  void changeTheme(ThemeData theme){
    Get.changeTheme(theme);
    saveTheme(theme.brightness == Brightness.dark);
  }

  void changeThemeMode(ThemeMode mode){
    Get.changeThemeMode(mode);
    saveTheme(mode == ThemeMode.dark);
    update();
  }
}