import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/material.dart';

import 'dart:async';

class TimerController extends GetxController {
  late Timer _timer;
  final _time = 300.obs;
  final _sec = 0.obs;
  final isTimeOut = false.obs;
  final _isPlaying = false.obs;

  RxInt get time => _time;
  RxInt get sec => _sec;

  @override
  void onInit() {
    start();
    super.onInit();
  }

  @override
  void onClose() {
    _timer.cancel();
    print('controller 제거');
    super.onClose();
  }

  void start() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _sec.value = _time.value ~/ 60;
      _time.value--;
      if (_time.value == 0) {
        isTimeOut.toggle();
        pause();
        _time.value = 299;
        _sec.value = 4;
      }
    });
  }

  void pause() {
    _timer.cancel();
  }

  void reset() {
    _timer.cancel();
    isTimeOut.toggle();
    _time.value = 299;
  }
}
