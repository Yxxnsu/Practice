import 'package:get/get.dart';

class FourController extends GetxController{
  static FourController get to => Get.find();
  RxInt one = 0.obs;

  int two = 10;

  void testing(){
    two = 2;
    testing2();
  }

  void testing2(){
    print(two + 4);
  }
}