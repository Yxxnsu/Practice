import 'package:flutter/material.dart';
import 'package:flutter_test_doc/controller/favorite_controller.dart';
import 'package:get/get.dart';

class FavoriteSelected extends GetView<FavoriteController> {
  FavoriteSelected({Key? key}) : super(key: key);
  final controller = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: SafeArea(
        child: GridView.builder(
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return SizedBox(
              height: 50,
              child: Card(
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 2 / 1,
                      child: Image.asset(
                        'assets/1.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap: () {
                            if (controller.isFavoriteList[index]) {
                              controller.isFavoriteList[index] = !controller.isFavoriteList[index];
                            } else if (controller.totalCount == 3) {
                                Get.defaultDialog(
                                  backgroundColor: Colors.white,
                                  title: '실패',
                                  titleStyle: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  content: const Text(
                                    '한명 당 3팀만 가능합니다.',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                            } else {
                              controller.isFavoriteList[index] = !controller.isFavoriteList[index];
                            }
                          },
                          child: Icon(
                            controller.isFavoriteList[index] == true
                              ? Icons.star
                              : Icons.star_border,
                            color: Colors.yellow,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
