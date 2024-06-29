import 'package:get/get.dart';
import 'package:travel/data/service/app_setting.dart';
//import '../../data/services/app_setting.dart';

const List<String> scopes = <String>[
  'email',
  'profile',
];

class AppController extends GetxController {
  final appSetting = Get.find<AppSetting>();
  //push setting
  final _isAllowNoti = false.obs;
  bool get isAllowNoti => _isAllowNoti.value;

  Future<AppController> init() async {
    return this;
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}