import 'package:flutter_test_doc/controller/multi_select_controller.dart';
import 'package:flutter_test_doc/controller/test_controller/one_controller.dart';
import 'package:flutter_test_doc/controller/test_controller/three_controller.dart';
import 'package:flutter_test_doc/controller/test_controller/two_controller.dart';
import 'package:flutter_test_doc/controller/timer_controller.dart';
import 'package:get/get.dart';

class initBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TimerController());
    Get.lazyPut(() => MultiSelectedController());
    Get.put(OneController());
    Get.put(TwoController());
    Get.put(ThreeController());
  }
}
