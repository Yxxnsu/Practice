import 'package:cloud_firestore/cloud_firestore.dart';

class Activity {
  final String imageUrl;
  final String name;
  final String type;
  final List<String> startTimes;
  final int rating;
  final int price;
  Activity({
    required this.imageUrl,
    required this.name,
    required this.type,
    required this.startTimes,
    required this.rating,
    required this.price,
  });

  Activity copyWith({
    String? imageUrl,
    String? name,
    String? type,
    List<String>? startTimes,
    int? rating,
    int? price,
  }) {
    return Activity(
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      type: type ?? this.type,
      startTimes: startTimes ?? this.startTimes,
      rating: rating ?? this.rating,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'type': type,
      'startTimes': startTimes,
      'rating': rating,
      'price': price,
    };
  }

  factory Activity.fromDocumentShapShot(DocumentSnapshot ds) {
    return Activity(
      imageUrl: ds['imageUrl'],
      name: ds['name'],
      type: ds['type'],
      startTimes: List<String>.from(ds['startTimes']),
      rating: ds['rating'],
      price: ds['price'],
    );
  }
}
