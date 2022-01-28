import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:road_api_test/controller/address_controller.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      initialBinding: BindingsBuilder((){
        Get.put(AddressController());
      }),
      title: 'Address Api Test',
      theme: ThemeData(
        primaryColor: const Color(0xff04C584),
      ),
      home: const HomeScreen(),
    );
  }
}