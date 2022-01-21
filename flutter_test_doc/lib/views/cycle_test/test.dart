import 'package:flutter/material.dart';
import 'package:flutter_test_doc/views/cycle_test/test2.dart';
import 'package:get/get.dart';

class TestView extends StatefulWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  @override
  void initState() {
    print('❌❌❌❌❌❌❌ INIT ❌❌❌❌❌❌❌');
    super.initState();
  }

  @override
  void dispose() {
    print('❌❌❌❌❌❌❌ DISPOSE ❌❌❌❌❌❌❌');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => Get.off(
                () => const TestView2(),
              ),
              child: const Text('ROUTE'),
            ),
          ],
        ),
      ),
    );
  }
}
