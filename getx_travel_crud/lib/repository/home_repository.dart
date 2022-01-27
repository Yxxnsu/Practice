import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getx_travel_crud/models/model.dart';

class HomeRepository {
  final _hotelCollection = FirebaseFirestore.instance.collection('hotel');
  final firebase = FirebaseFirestore.instance;

  Stream<List<Hotel>> getAllHotel() {
    return _hotelCollection.snapshots().map((query) {
      return query.docs.map((ds) => Hotel.fromDocumentSnapshot(ds)).toList();
    });
  }

  Stream<int> getDbLength() {
    return _hotelCollection.snapshots().map((query) {
      return query.docs.length;
    });
  }
}
