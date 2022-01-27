import 'package:cloud_firestore/cloud_firestore.dart';

class Hotel {
  final String docId;
  final String imageUrl;
  final String name;
  final String address;
  final int price;
  Hotel({
    required this.docId,
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.price,
  });

  Hotel copyWith({
    String? docId,
    String? imageUrl,
    String? name,
    String? address,
    int? price,
  }) {
    return Hotel(
      docId: docId ?? this.docId,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      address: address ?? this.address,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'docId': docId,
      'imageUrl': imageUrl,
      'name': name,
      'address': address,
      'price': price,
    };
  }

  factory Hotel.fromDocumentSnapshot(DocumentSnapshot ds) {
    return Hotel(
      docId: ds.id,
      imageUrl: ds['imageUrl'],
      name: ds['name'],
      address: ds['address'],
      price: ds['price'],
    );
  }
}

// final List<Hotel> hotels = [
//   Hotel(
//     imageUrl: 'assets/images/hotel0.jpg',
//     name: 'Hotel 0',
//     address: '404 Great St',
//     price: 175,
//   ),
//   Hotel(
//     imageUrl: 'assets/images/hotel1.jpg',
//     name: 'Hotel 1',
//     address: '404 Great St',
//     price: 300,
//   ),
//   Hotel(
//     imageUrl: 'assets/images/hotel2.jpg',
//     name: 'Hotel 2',
//     address: '404 Great St',
//     price: 240,
//   ),
// ];
