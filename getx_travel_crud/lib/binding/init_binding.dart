import 'package:get/instance_manager.dart';
import 'package:getx_travel_crud/controller/controller.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    //TODO: put 방식 생각.
    Get.put(LoginController());
    Get.put(HomeController());
  }
}