import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestValueBuilder extends StatelessWidget {
  const TestValueBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ValueBuilder<int?>(
          initialValue: 10,
          builder: (value, updateFn) {
            return Column(
              children: [
                Text("count -> " + value.toString()),
                ElevatedButton(
                  onPressed: () {
                    updateFn(value! + 1);
                  },
                  child: Text('ValueBuilder -> add'),
                )
              ],
            );
          },
          onUpdate: (value) => print("Value updated: $value"),
          onDispose: () => print("Widget unmounted"),
        ),
        // ValueBuilder<bool>(
        //   initialValue: true,
        //   builder: (isChecked, updateFn) => Switch(
        //     value: isChecked,
        //     onChanged: (newValue) => updateFn(newValue),
        //   ),
        // )
      ],
    );
  }
}
