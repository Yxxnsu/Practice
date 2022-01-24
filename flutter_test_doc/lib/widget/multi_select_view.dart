import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_test_doc/controller/multi_select_controller.dart';

class MultiSelectView extends GetView<MultiSelectedController> {
  MultiSelectView({Key? key}) : super(key: key);

  final _iconList = <IconList>[
    IconList(icon: Icons.umbrella, tag: '1'),
    IconList(icon: Icons.place, tag: '2'),
    IconList(icon: Icons.snowboarding_rounded, tag: '3'),
    IconList(icon: Icons.ac_unit, tag: '4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TEST'),
      ),
      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(
                      _iconList.length,
                      (index) => CustomIcon(
                        item: _iconList[index],
                        onSelected: (value) {
                          if (value) {
                            controller.clipList.add(_iconList[index]);
                          } else {
                            controller.clipList.remove(_iconList[index]);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Row(
                  children: [
                    ...List.generate(
                      controller.clipList.length,
                      (index) => Chip(
                        label: Text(controller.clipList[index].tag),
                        backgroundColor: Colors.blue,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  final IconList item;
  final ValueChanged<bool> onSelected;

  CustomIcon({
    Key? key,
    required this.item,
    required this.onSelected,
  }) : super(key: key) {
    Get.put(MultiSelectedController(), tag: item.tag);
  }

  MultiSelectedController get controller => Get.find(tag: item.tag);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.isSelected.toggle();
          onSelected(controller.isSelected.value);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          child: Icon(
            item.icon,
          ),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: controller.isSelected.value == true
                ? Border.all(
                    width: 2,
                    color: Colors.orange,
                  )
                : null,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class IconList {
  final IconData icon;
  final String tag;
  IconList({
    required this.icon,
    required this.tag,
  });
}
