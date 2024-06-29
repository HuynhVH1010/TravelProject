import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AppConnectionController extends GetxController {
  String connectionType = 'No Internet';
  bool isOnline = true;
  //Instance of Flutter Connectivity
  final Connectivity _connectivity = Connectivity();
  //Stream to keep listening to network change state
  late StreamSubscription _streamSubscription ;

  Future<AppConnectionController> init() async {
    await GetConnectionType();
    _streamSubscription = _connectivity.onConnectivityChanged.listen(_updateState);
    return this;
  }

  // a method to get which connection result, if you we connected to internet or no if yes then which network
  Future<void>GetConnectionType() async{
    var connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch(e){
      print(e);
    }
    return _updateState(connectivityResult);
  }

  // state update, of network, if you are connected to WIFI connectionType will get set to 1,
  // and update the state to the consumer of that variable.
  _updateState(ConnectivityResult result) {
    switch(result) {
      case ConnectivityResult.wifi:
        connectionType='Connected to Wifi';
        isOnline = true;
        update();
        break;
      case ConnectivityResult.mobile:
        connectionType='Connected to Mobile Internet';
        isOnline = true;
        update();
        break;
      case ConnectivityResult.none:
        connectionType='No internet';
        isOnline = false;
        update();
        break;
      default:
        connectionType='Failed to get Network Status';
        isOnline = false;
        update();
        Get.snackbar('Network Error', 'Failed to get Network Status');
        break;
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }
}