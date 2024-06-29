import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel/data/service/app_setting.dart';
import '../../core/utils/app_controller.dart';
import '../../core/values/colors.dart';
//import '../../data/services/app_setting.dart';
import 'dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  final appSetting = Get.find<AppSetting>();
  final appController = Get.find<AppController>();

  DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    var acticeColor = isDarkTheme?kYellowColor:kPrimaryColor;
    var color = isDarkTheme?Colors.white38:Colors.grey;
    var iconSize = 26.0;
    //
    return GetBuilder<DashboardController>(
      dispose: (state){},
      builder: (_cc){
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: PageView(
            controller: _cc.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: _cc.pages,
          ),
          bottomNavigationBar: StyleProvider(
            style: Style(),
            child: Obx(() => ConvexAppBar(
              color: color,
              activeColor: acticeColor,
              backgroundColor: isDarkTheme?kSecondColor:kPrimaryBackgroundColor,
              style: TabStyle.fixedCircle,
              items: [
                TabItem(
                  title: '',
                  activeIcon: Icon(
                    Icons.home,
                    size: iconSize,
                    color: acticeColor,
                  ),
                  icon: Icon(
                    Icons.history,
                    size: iconSize,
                    color: color,
                  ),
                ),
                TabItem(
                  title: '',
                  activeIcon: Icon(
                    Icons.check_circle_sharp,
                    size: iconSize,
                    color: acticeColor,
                  ),
                  icon: Icon(
                    Icons.access_time,
                    size: iconSize,
                    color:color,
                  ),
                ),
                TabItem(
                  title: '',
                  activeIcon: Container(
                    decoration: BoxDecoration(
                      color: acticeColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_circle_sharp,
                      size: iconSize*0.8,
                      color: Colors.white,
                    ),
                  ),
                  icon: Container(
                    decoration: BoxDecoration(
                      color: isDarkTheme?Color(0xFF424141):Color(0xFFE5E4E4),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.fact_check_outlined,
                      size: iconSize*0.8,
                      color: color,
                    ),
                  ),
                ),
                TabItem(
                  title: '',
                  activeIcon: Icon(
                    Icons.favorite,
                    size: iconSize,
                    color: acticeColor,
                  ),
                  icon: Icon(
                    Icons.favorite_outline,
                    size: iconSize,
                    color: color,
                  ),
                ),
                TabItem(
                  title: '',
                  activeIcon: Icon(
                    Icons.settings,
                    size: iconSize,
                    color: acticeColor,
                  ),
                  icon: Icon(
                    Icons.settings_outlined,
                    size: iconSize,
                    color: color,
                  ),
                ),
              ],
              onTap: (index){
                _cc.changeTabIndex(index);
              },
              initialActiveIndex: _cc.tabIndex.value,
              disableDefaultTabController: true,
              height: 50,
              top: -30,
              controller: _cc.tabController,
            )),
          ),
        );
      },
    );
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 40;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => 20;

  @override
  TextStyle textStyle(Color color, String? fontFamily) {
    return TextStyle(fontSize: 20, color: color, fontFamily: fontFamily);
  }
}
