import 'package:get/get.dart';

class ThreeController extends GetxController {
  RxInt three = 0.obs;
  double threeDouble = 1.0;

  static ThreeController get to => Get.find();
  double get threes => threeDouble;
}
