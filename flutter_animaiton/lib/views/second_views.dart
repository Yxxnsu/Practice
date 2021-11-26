import 'package:flutter/material.dart';
import 'package:flutter_animaiton/controller/test_controller.dart';
import 'package:flutter_animaiton/views/third_view.dart';
import 'package:get/get.dart';

class SecondView extends StatelessWidget {
  SecondView({Key? key}) : super(key: key);
  final controller = Get.put(TestController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              TestController.to.count.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            ElevatedButton(
              onPressed: () => Get.offAllNamed('third'),
              child: Text('Route 3'),
            ),
            ElevatedButton(
              onPressed: () => controller.toggle(),
              child: Text('Change Value'),
            ),
          ],
        ),
      ),
    );
  }
}
