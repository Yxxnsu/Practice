import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  static TestController get to => Get.find();

  RxInt number = 0.obs;
  final list = <int>[].obs;
  final str = 'GetX'.obs;
  int count = 0;
  int count1 = 0;
  final isRight = false.obs;
  final isYeon = false.obs;
  bool isSign = false;

  bool get isValid => isRight.value | isYeon.value;

  @override
  void onInit() {
    super.onInit();
    print('Getx Controller Init');
  }

  @override
  void onClose() {
    super.onClose();
    print('Getx Controller Close!');
  }

  increment() => number++;

  void toggle() {
    isSign = true;
    update();
  }

  void countUp() {
    count++;
    update();
  }

  void countDown() {
    count--;
    update();
  }
}
