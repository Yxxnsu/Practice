import 'package:flutter/material.dart';

class TestScrolling extends StatelessWidget {
  TestScrolling({Key? key}) : super(key: key);

  final focusNode = List.generate(10, (index) => FocusNode());
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    const double? _height = 100;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: ListView.builder(
        controller: _controller,
        itemCount: 100,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => _controller.animateTo(_height * 9,
                duration: const Duration(seconds: 2), curve: Curves.easeInOut),
            child: Container(
              height: _height,
              decoration: BoxDecoration(
                color: index == 9 ? Colors.purpleAccent : null,
                border: Border.all(
                  color: Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
