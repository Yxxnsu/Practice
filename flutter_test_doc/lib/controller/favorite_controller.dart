import 'package:get/get.dart';

class FavoriteController extends GetxController {
  //TODO: List 안에 있는 것은 bool 타입인데 obs이기 때문에 내부의 element가 바뀌면 obs도 반응
  final isFavoriteList = <bool>[false, false, false, false].obs;

  //TODO: 내부 인스턴스 참조할 때에는 get 설정할 때에는 set method 활용!
  get totalCount => isFavoriteList.where((p0) => p0 == true).length;

  // final totalCount = FavoriteController()
  //     .isFavoriteList
  //     .where(
  //       (p0) => p0 == true,
  //     )
  //     .length;
}
