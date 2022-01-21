import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView2 extends StatelessWidget {
  const TestView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test2'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Test2'),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: const Text('BACK'),
            ),
          ],
        ),
      ),
    );
  }
}
