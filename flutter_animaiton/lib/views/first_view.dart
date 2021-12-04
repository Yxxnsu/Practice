import 'package:flutter/material.dart';
import 'package:flutter_animaiton/controller/test_controller.dart';
import 'package:flutter_animaiton/views/second_views.dart';
import 'package:get/get.dart';

class FirstView extends GetView<TestController> {
  const FirstView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          controller.countUp();
          controller.isRight.toggle();
          controller.count1++;
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //TODO: Getbulder 안에서는 obx 변수도 바뀐다.
            GetBuilder<TestController>(
              builder: (_) {
                return Column(
                  children: [
                    Text(
                      controller.count.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    controller.count1 > 10
                        ? const Text(
                            '10보다 큼',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : const Text('안 큼'),
                    Text(controller.isValid.toString()),
                  ],
                );
              },
            ),
            Obx(() => Text(controller.isValid.toString())),
            Text(controller.isValid.toString()),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/second');
                print(controller.count);
              },
              child: const Text('Route'),
            )
          ],
        ),
      ),
    );
  }
}
