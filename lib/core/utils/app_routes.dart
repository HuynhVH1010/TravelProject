import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:travel/pages/Screen/Error.dart';
import 'package:travel/pages/Screen/SplashScreen.dart';
import '../../pages/dashboard/dashboard_binding.dart';
import '../../pages/dashboard/dashboard_page.dart';
//import '../../pages/error/error404_page.dart';

abstract class Routes {
  static const DASHBOARD = '/';
  static const ERROR404 = '/error404';
}

abstract class AppPages {
  AppPages._();

  static const INITIAL = Routes.DASHBOARD;

  static GetPage unknowPage = GetPage(
    name: Routes.ERROR404,
    page: () => Error404Page(),
  );

  static final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage<DashboardPage>(
      name: Routes.DASHBOARD,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
      participatesInRootNavigator: true,
      transition: Transition.noTransition,
      transitionDuration: Duration(milliseconds: 100),
    ),
  ];

}