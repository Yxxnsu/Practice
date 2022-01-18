import 'package:get/get.dart';

class OneController extends GetxController {
  static OneController get to => Get.find();
  RxInt one = 0.obs;
  double oneDouble = 1.0;
  late int two;
  final isRight = false.obs;

  @override
  void onInit() {
    two = 2;
    super.onInit();
  }
}
