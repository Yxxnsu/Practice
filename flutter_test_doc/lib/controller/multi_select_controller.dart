import 'package:flutter_test_doc/widget/multi_select_view.dart';
import 'package:get/get.dart';

class MultiSelectedController extends GetxController {
  static MultiSelectedController get to => Get.find();
  final isSelected = false.obs;
  final clipList = <IconList>[].obs;
}
