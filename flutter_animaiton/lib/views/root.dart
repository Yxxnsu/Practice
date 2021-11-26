import 'package:flutter/material.dart';
import 'package:flutter_animaiton/controller/test_controller.dart';
import 'package:flutter_animaiton/views/first_view.dart';
import 'package:flutter_animaiton/views/second_views.dart';
import 'package:get/get.dart';

class RootView extends GetView<TestController> {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TestController>(
        builder: (_) {
          return controller.isSign ? const FirstView() : SecondView();
        },
      ),
    );
  }
}
