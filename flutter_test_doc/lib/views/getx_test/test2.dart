import 'package:flutter/material.dart';
import 'package:flutter_test_doc/controller/test_controller/one_controller.dart';
import 'package:get/get.dart';

class TestView2 extends GetView<OneController> {
  const TestView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('${controller.two}'),
    );
  }
}
