import 'package:flutter/material.dart';
import 'package:flutter_test_doc/controller/test_controller/one_controller.dart';
import 'package:flutter_test_doc/controller/test_controller/three_controller.dart';
import 'package:flutter_test_doc/controller/test_controller/two_controller.dart';
import 'package:get/get.dart';

class TestView2 extends GetView<OneController> {
  const TestView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 300,
          ),
          Obx(
            () => Text(
              controller.one.toString(),
              textScaleFactor: 3,
            ),
          ),
          Obx(
            () => Text(
              TwoController.to.two.toString(),
              textScaleFactor: 3,
            ),
          ),
          GetBuilder<ThreeController>(
            init: ThreeController(),
            builder: (_) {
              return Text(
                _.three.toString(),
                textScaleFactor: 3,
              );
            },
          ),
          Expanded(child: SizedBox()),
          button(
            onTap1: () => controller.one++,
            onTap2: () => controller.one--,
            text1: 'One Increased',
            text2: 'One Decreased',
          ),
          button(
            onTap1: () => TwoController.to.two++,
            onTap2: () => TwoController.to.two--,
            text1: 'Two Increased',
            text2: 'Two Decreased',
          ),
          button(
            onTap1: () {
              ThreeController.to.three++;
              ThreeController.to.update();
            },
            onTap2: () {
              ThreeController.to.three--;
              ThreeController.to.update();
            },
            text1: 'Third Increased',
            text2: 'Third Decreased',
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}

class button extends StatelessWidget {
  const button({
    required this.onTap1,
    required this.onTap2,
    required this.text1,
    required this.text2,
  });

  final VoidCallback onTap2;
  final VoidCallback onTap1;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: onTap1,
          child: Text(text1),
        ),
        ElevatedButton(
          onPressed: onTap2,
          child: Text(text2),
        ),
      ],
    );
  }
}
