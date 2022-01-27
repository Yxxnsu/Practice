import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_travel_crud/controller/login_controller.dart';

class GenderScreen extends StatelessWidget {
  const GenderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GetBuilder<LoginController>(
          builder: (_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Spacer(),
                const Text(
                  'I am a',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ...List.generate(2, (index) {
                  return GestureDetector(
                    onTap: () {
                      _.selectedIndexGender = index;
                      _.update();
                      _.changeGender(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: _.selectedIndexGender == index ? const Color(0xffFE3C72) : Colors.white,
                        borderRadius: BorderRadius.circular(30),                        
                      ),
                      child: Center(
                        child: Text(                                                
                          index == 0 ? 'MAN' : 'WOMEN',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _.selectedIndexGender == index ? Colors.white : Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ),
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      _.selectedIndexGender == -1 
                      ? null 
                      : _.addToUserFinal();
                    }, 
                    style: ElevatedButton.styleFrom(
                      primary: _.selectedIndexGender == -1 ? Colors.grey[400] : const Color(0xffFE3C72),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )
                    ),
                    child: const Text(
                      'CONTINUES',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.width * 0.3,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
