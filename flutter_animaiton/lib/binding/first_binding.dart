import 'package:flutter_animaiton/controller/test_controller.dart';
import 'package:get/get.dart';

class IntialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestController());
  }
}
