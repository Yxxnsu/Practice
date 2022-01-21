import 'package:flutter/material.dart';
import 'package:flutter_test_doc/controller/test_controller/four_controller.dart';
import 'package:get/get.dart';

class Hello extends StatelessWidget {
  const Hello({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          child: Text(
            '${FourController.to.one.value}',
          ),
        ));
  }
}
