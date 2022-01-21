import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test_doc/controller/test_controller/one_controller.dart';
import 'package:flutter_test_doc/controller/test_controller/two_controller.dart';
import 'package:flutter_test_doc/views/getx_test/test2.dart';
import 'package:get/get.dart';

class TestView extends GetView<OneController> {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                child: const Text('up'),
                onPressed: () {
                  // TwoController.to.oneTo++;
                  var rng = new Random();
                  controller.one++;
                  controller.isRight.toggle();

                  //! Success
                  //TwoController.to.oneTo.value = 10 + rng.nextInt(10);
                  //! Success
                  // TwoController.to.changeValue(10 + rng.nextInt(10));

                  TwoController.to.test++;
                  print(TwoController.to.numberof);
                }),
            Obx(() => Text('${OneController.to.one}')),
            Obx(() => Text('${OneController.to.isRight}')),
            Obx(() => Text('${TwoController.to.isRights}')),
            Obx(() => Text('${TwoController.to.oneTo}')),
            Text('${TwoController.to.numberof}'),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                child: const Text('Page 2'),
                onPressed: () => Get.to(() => const TestView2()),
              ),
            ),
            const TestView2(),
          ],
        ),
      ),
    );
  }
}
