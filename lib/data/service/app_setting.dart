import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class AppSetting extends GetxService {
  final _storage = GetStorage();
  //
  late double screenWidth = double.infinity;
  late double screenHeight = double.infinity;
  late Orientation orientation = Orientation.portrait;
  late double defaultSize = 10.0;
  //
  final _fontSize = 15.0.obs;
  final _padding = 15.0.obs;
  final _sp = 1.0.obs;

  Future<AppSetting> init() async {
    if(GetPlatform.isMobile)
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp],);
    //
    return this;
  }

  void setConfig(BuildContext context) async {
    MediaQueryData _query = MediaQuery.of(context);
    var _fsize = context.responsiveValue<double>(mobile: 17, tablet: 19, desktop: 21, watch: 13);
    _fontSize.value = _fsize;
    ///
    screenWidth = _query.size.width;
    screenHeight = _query.size.height;
    orientation = _query.orientation;
    ///
    if(isTablet()){
      defaultSize = orientation == Orientation.landscape ? screenHeight* 0.0097 : screenWidth * 0.0097;
      _sp.value = defaultSize*0.15;
    } else if(isDesktop()){
      defaultSize = orientation == Orientation.landscape ? screenHeight* 0.0073 : screenWidth * 0.0073;
      _sp.value = defaultSize*0.18;
    } else {
      defaultSize = orientation == Orientation.landscape ? screenHeight * 0.024 : screenWidth * 0.024;
      _sp.value = defaultSize*0.12;
    }
    //
    _padding.value = defaultSize*1.5;
  }

  //
  double get padding => _padding.value;
  //
  double get fontSize => _fontSize.value;
  //
  double get sp => _sp.value;
  //
  final double maxWidthMobile = 650;
  final double maxWidthTablet = 920;
  final double maxWidthDesktop = 1200;
  // This isMobile, isTablet, isDesktop helep us later
  bool isMobile() => Get.mediaQuery.size.width < maxWidthMobile;
  bool isTablet() => Get.mediaQuery.size.width < maxWidthTablet && Get.mediaQuery.size.width >= maxWidthMobile;
  bool isDesktop() => Get.mediaQuery.size.width < maxWidthDesktop && Get.mediaQuery.size.width >= maxWidthTablet;
  bool is4K() => Get.mediaQuery.size.width >= maxWidthDesktop;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> clearData() async {
  }
}