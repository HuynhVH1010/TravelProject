import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:travel/core/utils/app_connection_controller.dart';
import 'package:travel/core/utils/app_controller.dart';
import 'package:travel/core/utils/app_routes.dart';
import 'package:travel/core/utils/app_theme.dart';
import 'package:travel/core/utils/app_theme_controller.dart';
import 'package:travel/data/service/Authcontroller.dart';
import 'package:travel/data/service/app_setting.dart';
import 'package:travel/pages/Screen/Plane.dart';
import 'package:travel/pages/Screen/ReviewScreen.dart';
import 'package:travel/pages/Screen/SplashScreen.dart';
import 'package:travel/pages/dashboard/dashboard_page.dart';
import 'package:travel/pages/detail_place_page.dart';
import 'package:travel/pages/favorite_page.dart';
import 'package:travel/pages/place_page.dart';
import 'package:travel/pages/search_page.dart';
import 'package:travel/pages/test.dart';
import 'package:travel/pages/testcategory.dart';
import 'package:travel/pages/testlich.dart';
import 'package:travel/pages/testthongtinaccount.dart';
import 'package:travel/profile/Information.dart';
import 'package:travel/pages/Screen/LoginManlam.dart';
import 'package:travel/demo/LoginScreen.dart';
import 'package:travel/demo/LoginThaiLam.dart';
import 'package:travel/profile/Profile.dart';
import 'package:travel/pages/Screen/Register.dart';
import 'package:travel/demo/RegisterScreen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await initService();
//   runApp(
//     const MyApp()
//   );
// }
//
// Future<void> initService() async {
//   await GetStorage.init();
//   //
//   await Get.putAsync(() => AppConnectionController().init());
//   await Get.putAsync(() => AppSetting().init());
//   await Get.putAsync(() => AppController().init(), permanent: true);
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final _appThemeController = Get.put(AppThemeController());
//     return GetMaterialApp(
//       home: DashboardPage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Platform.isAndroid
  //     ? await Firebase.initializeApp(
  //     options: FirebaseOptions(
  //       apiKey: "AIzaSyB7yp0Te3VfPYDl-9sYyw-6PO_OiTp9TTA",
  //       appId: "1:145799333330:android:0f787405d262f07339b40b",
  //       messagingSenderId: "145799333330",
  //       projectId: "travelapp-cbdd5",
  //     ))
  //     : await Firebase.initializeApp();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()),);
  await initService();
  runApp(MyApp());
}

Future<void> initService() async {
  await GetStorage.init();
  //
  await Get.putAsync(() => AppConnectionController().init());
  await Get.putAsync(() => AppSetting().init());
  await Get.putAsync(() => AppController().init(), permanent: true);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _appThemeController = Get.put(AppThemeController());

    return GetMaterialApp(
      //home: DashboardPage(),
      //title: "EXAM",
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {}),
      fallbackLocale: Locale('vi', 'VN'), //ngôn ngữ mặc định của ứng dụng là tiếng Việt
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      themeMode: _appThemeController.appThemeMode,
      getPages: AppPages.pages,
      initialRoute: AppPages.INITIAL,     //Định nghĩa trang ban đầu của ứng dụng.
      unknownRoute: AppPages.unknowPage,
      transitionDuration: Duration(milliseconds: 100),
      builder: (context, child) {
        return ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child!),
          minWidth: 320,
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.resize(320, name: MOBILE),
            ResponsiveBreakpoint.resize(650, name: TABLET),
            ResponsiveBreakpoint.resize(920, name: DESKTOP),
            ResponsiveBreakpoint.resize(1250, name: '4K'),
          ],
        );
      },
    );
  }
}
