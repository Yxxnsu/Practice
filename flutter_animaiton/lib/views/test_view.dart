import 'package:flutter/material.dart';

class TestView extends StatefulWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  @override
  Widget build(BuildContext context) {
    var a = <int>[1, 2, 3, 4, 5];
    return Scaffold(
        appBar: AppBar(
          title: const Text('TestView'),
        ),
        body: Row(
          children: [
            Expanded(
                child: Align(alignment: Alignment.center, child: Text('hh'))),
            Column(
              children: [
                Text('Hello'),
              ],
            )
          ],
        ),
      );
  }
}
