import 'package:flutter_test_doc/controller/test_controller/one_controller.dart';
import 'package:get/get.dart';

class TwoController extends GetxController {
  RxInt two = 0.obs;
  double twoDouble = 1.0;
  RxInt oneTo = 0.obs;
  RxInt test = 0.obs;
  RxBool isRights = OneController.to.isRight;
  static TwoController get to => Get.find();

  void getOneValue(RxInt one){
    print(one);
    // oneTo = one;
  }

   void changeValue(int one){
    oneTo.value = one;
   }

   int get numberof => test.value;
}
