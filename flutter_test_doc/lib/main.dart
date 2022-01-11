// ignore_for_file: void_checks

import 'package:flutter/material.dart';
import 'package:flutter_test_doc/binding/binding.dart';
import 'package:flutter_test_doc/views/cycle_test/test.dart';
import 'package:flutter_test_doc/views/woody/custom_drawer.dart';
import 'package:flutter_test_doc/views/woody/woody.dart';
import 'package:flutter_test_doc/widget/face_dectection.dart';
import 'package:flutter_test_doc/widget/ticket.dart';
import 'package:get/route_manager.dart';
// import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Woody());
}

class Woody extends StatelessWidget {
  const Woody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Woodys(),
    );
  }
}

class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: initBinding(),
      home: const TestView(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialBinding: initBinding(),
      home: ChangeNotifierProvider(
        create: (_) => FaceDetectionState(),
        child: FaceDetection(),
      ),
    );
  }
}
