import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:getx_travel_crud/models/model.dart';
import 'package:getx_travel_crud/repository/home_repository.dart';

class HomeController extends GetxController {
  final hotel = <Hotel>[].obs;
  RxInt index = 0.obs;
  int selectedIndex = 0;

  final DatabaseReference _ref = FirebaseDatabase.instance.ref('user');
  DatabaseReference get ref => _ref;


  @override
  void onInit() {
    Stream<DatabaseEvent> stream = ref.onValue;
    stream.listen((event) {
      index.value = event.snapshot.children.length;
      print(index.value);
    });

    hotel.bindStream(getAllHotel());
    index.bindStream(getDbLength());

    super.onInit();
  }

  Stream<List<Hotel>> getAllHotel() => HomeRepository().getAllHotel();
  Stream<int> getDbLength() => HomeRepository().getDbLength();

  @override
  void onClose() {
    super.onClose();
  }
}
