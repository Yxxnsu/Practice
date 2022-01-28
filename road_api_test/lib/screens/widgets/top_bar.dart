import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
    required this.title,
    required this.closeIcon,
    this.height = 60,
  }) : super(key: key);

  final String title;
  final Icon closeIcon;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          titleWidget(),
          closeWidget(context),
        ],
      ),
    );
  }

  Widget titleWidget() {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      height: height,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget closeWidget(BuildContext context) {
    return SizedBox(
      height: height,
      width: height,
      child: Material(
        color: Colors.white,
        child: InkWell(
          splashColor: const Color(0xFF757575),
          onTap: ()=> Get.back(),
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            child: closeIcon,
          ),
        ),
      ),
    );
  }
}

