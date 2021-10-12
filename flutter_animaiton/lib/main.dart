import 'package:flutter/material.dart';
import 'package:flutter_animaiton/views/test_view.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnimationSelectView(),
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
