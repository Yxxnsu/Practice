import 'package:flutter/material.dart';
import 'package:flutter_test_doc/controller/test_controller/four_controller.dart';
import 'package:flutter_test_doc/views/bindingTest/bind_page.dart';
import 'package:get/get.dart';

class Test extends StatelessWidget {
  const Test({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 40,
              width: 40,
              color: Colors.blue,
              alignment: Alignment(-0.3,0),
              child: Container(
                width: 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.green,
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: ()=> Get.to(()=> BindingPage(),binding: BindingsBuilder((){
              Get.put(FourController());
            })), child: const Text('이동')
            ),
          ],
        )
      )
    );
  }
}