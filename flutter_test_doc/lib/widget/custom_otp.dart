import 'package:flutter/material.dart';
import 'package:flutter_test_doc/widget/value_builder.dart';
import 'package:get/get.dart';

class CustomOTP extends StatelessWidget {
  CustomOTP({Key? key}) : super(key: key);

  final _controller = List.generate(
    4,
    (_) => TextEditingController(),
  );
  // List<TextEditingController> controller = [num1,num2,num3,num4];
  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(4, (_) {
                    return Container(
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: TextFormField(
                          autofocus: _ == 0 ? true : false,
                          textAlign: TextAlign.center,
                          controller: _controller[_],
                          maxLength: 1,
                          onChanged: (value) {
                            if (value.length == 1) {
                              node.nextFocus();
                              if (_ == 3) {
                                node.unfocus();
                              }
                            }
                          },
                          decoration: const InputDecoration(
                            counterText: "",
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          // showCursor: false,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
