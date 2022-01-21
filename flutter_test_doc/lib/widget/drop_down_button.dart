import 'package:flutter/material.dart';

class DropDownButtonTest extends StatefulWidget {
  const DropDownButtonTest({Key? key}) : super(key: key);

  @override
  State<DropDownButtonTest> createState() => _DropDownButtonTestState();
}

class _DropDownButtonTestState extends State<DropDownButtonTest> {
  int? _value = 0;
  String? _currentValue = 'ASC';
  String? _selectedValue = '첫번째';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
            value: _value,
            items: <int, dynamic>{0: 'hello', 1: '하하'}
                .entries
                .map(
                  (e) => DropdownMenuItem(
                    child: Text(e.value),
                    value: e.key,
                  ),
                )
                .toList(),
            onChanged: (int? value) => setState(() {
              _value = value;
            }),
          ),
          DropdownButton(
            value: _selectedValue,
            items: <String>['첫번째', '두번째', '세번째']
                .map(
                  (e) => DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  ),
                )
                .toList(),
            onChanged: (String? value) {
              setState(() {
                _selectedValue = value!;
              });
            },
          ),
          DropdownButton<String>(
            value: _currentValue,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 16,
            elevation: 11,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 1,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                _currentValue = newValue;
              });
            },
            items: <String>['ASC', 'DESC']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
