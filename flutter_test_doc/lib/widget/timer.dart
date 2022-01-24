import 'package:flutter/material.dart';
import 'package:flutter_test_doc/controller/timer_controller.dart';
import 'package:get/get.dart';

import '../views/getx_test/second_view.dart';

class TimerView extends GetView<TimerController> {
  const TimerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              controller.isTimeOut.value
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.timer_off,
                          color: Colors.red,
                          size: 16,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '입력시간이 초과했습니다',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    )
                  : Text(
                      '${controller.sec.value} : ' +
                          '${controller.time % 60}'.padLeft(2, '0'),
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                      ),
                    ),
              const SizedBox(
                height: 20,
              ),
              // 메세지 도착 안한 경우
              TextButton(
                onPressed: () {
                  controller.reset();
                  controller.start();
                },
                child: const Text('인증번호 다시 보내기!'),
              ),
              TextButton(
                onPressed: () => Get.off(() => const SecondView()),
                child: const Text('스크린 이동'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
