import 'package:flutter/material.dart';
import 'package:flutter_animaiton/views/first_view.dart';
import 'package:flutter_animaiton/views/root.dart';
import 'package:flutter_animaiton/views/second_views.dart';
import 'package:flutter_animaiton/views/test_view.dart';
import 'package:get/get.dart';

import 'binding/first_binding.dart';
import 'views/third_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: IntialBinding(),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const RootView(),
          transition: Transition.fadeIn,
          binding: IntialBinding(),
          // binding: BindingsBuilder((){
          //   Get.lazyPut(() => TestController());
          // }),
        ),
        GetPage(
          name: '/second',
          page: () => SecondView(),
          transition: Transition.cupertino,
        ),
        GetPage(
          name: '/third',
          page: () => ThirdView(),
          transition: Transition.zoom,
        ),
      ],
      title: 'Flutter Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RootView(),
    );
  }
}

class AnimationSelectView extends StatefulWidget {
  const AnimationSelectView({Key? key}) : super(key: key);

  @override
  State<AnimationSelectView> createState() => _AnimationSelectViewState();
}

class _AnimationSelectViewState extends State<AnimationSelectView> {
  bool _trigger = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedPhysicalModel(
                  child: Container(
                    height: 100,
                    width: 100,
                  ),
                  shape: BoxShape.rectangle,
                  elevation: _trigger ? 10 : 20,
                  color: _trigger ? Colors.black : Colors.yellow,
                  shadowColor: _trigger ? Colors.blue : Colors.red,
                  duration: const Duration(seconds: 1),
                  curve: Curves.bounceInOut,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () => setState(() {
                    _trigger = !_trigger;
                  }),
                  child: const Text("AnimatedPhysicalModel Start"),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () => Get.to(() => const TestView()),
                  child: Text('Go to TestScreen'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
