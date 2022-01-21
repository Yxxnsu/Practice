import 'package:flutter/material.dart';
import 'package:flutter_test_doc/controller/test_controller/four_controller.dart';
import 'package:flutter_test_doc/test_view.dart';
import 'package:flutter_test_doc/views/bindingTest/hello.dart';
import 'package:get/get.dart';

class BindingPage extends GetView<FourController> {
  const BindingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Binding Test'),
        ),
        floatingActionButton:
            FloatingActionButton(onPressed: () => controller.one.value++),
        body: Center(
          child: Obx(() => Column(
                children: [
                  Text('${controller.one.value}'),
                  const Hello(),
                  ElevatedButton(onPressed: ()=> Get.to(()=> TestView2()), child: Text('이동')),
                  ElevatedButton(onPressed: ()=> controller.testing(), child: const Text('TEST')) ,
                ],
              )),
        ));
  }
}
