import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getx_travel_crud/models/activity_model.dart';

class Destination {
  // final String docId;
  final String imageUrl;
  final String city;
  final String country;
  final String description;
  final List<Activity> activities;
  Destination({
    // required this.docId,
    required this.imageUrl,
    required this.city,
    required this.country,
    required this.description,
    required this.activities,
  });

  Destination copyWith({
    // String? docId,
    String? imageUrl,
    String? city,
    String? country,
    String? description,
    List<Activity>? activities,
  }) {
    return Destination(
      // docId: docId ?? this.docId,
      imageUrl: imageUrl ?? this.imageUrl,
      city: city ?? this.city,
      country: country ?? this.country,
      description: description ?? this.description,
      activities: activities ?? this.activities,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // 'docId': docId,
      'imageUrl': imageUrl,
      'city': city,
      'country': country,
      'description': description,
      'activities': activities.map((e) => e.toMap()).toList(),
    };
  }

  factory Destination.fromDocumentSnapshot(DocumentSnapshot ds) {
    return Destination(
      // docId: ds['docId'],
      imageUrl: ds['imageUrl'],
      city: ds['city'],
      country: ds['country'],
      description: ds['description'],
      activities: List<Activity>.from(ds['activities']),
    );
  }

  static List<Destination> getDestination(){
    List<Activity> activities = [
      Activity(
        imageUrl: 'https://firebasestorage.googleapis.com/v0/b/getx-travel-ui.appspot.com/o/stmarksbasilica.jpg?alt=media&token=eed4bbb4-51eb-4690-8910-52538a05625b',
        name: 'St. Mark\'s Basilica',
        type: 'Sightseeing Tour',
        startTimes: ['9:00 am', '11:00 am'],
        rating: 5,
        price: 30,
    ),
    Activity(
      imageUrl: 'https://firebasestorage.googleapis.com/v0/b/getx-travel-ui.appspot.com/o/gondola.jpg?alt=media&token=14ba114e-47cd-4669-939b-3b62e384b3c0',
      name: 'Walking Tour and Gonadola Ride',
      type: 'Sightseeing Tour',
      startTimes: ['11:00 pm', '1:00 pm'],
      rating: 4,
      price: 210,
    ),
    Activity(
      imageUrl: 'https://firebasestorage.googleapis.com/v0/b/getx-travel-ui.appspot.com/o/murano.jpg?alt=media&token=231d5c63-e609-45c7-8fdd-0e456d93c14d',
      name: 'Murano and Burano Tour',
      type: 'Sightseeing Tour',
      startTimes: ['12:30 pm', '2:00 pm'],
      rating: 3,
      price: 125,
    ),
  ];

  List<Destination> destinations = [
    Destination(
      imageUrl: 'https://firebasestorage.googleapis.com/v0/b/getx-travel-ui.appspot.com/o/venice.jpg?alt=media&token=eb40e139-1b34-4c07-8c8b-ab0a647c3e31',
      city: 'Venice',
      country: 'Italy',
      description: 'Visit Venice for an amazing and unforgettable adventure.',
      activities: activities,
    ),
    Destination(
      imageUrl: 'https://firebasestorage.googleapis.com/v0/b/getx-travel-ui.appspot.com/o/paris.jpg?alt=media&token=cec7a9a8-30e7-41c7-84cb-97f1930b671c',
      city: 'Paris',
      country: 'France',
      description: 'Visit Paris for an amazing and unforgettable adventure.',
      activities: activities,
    ),
    Destination(
      imageUrl: 'https://firebasestorage.googleapis.com/v0/b/getx-travel-ui.appspot.com/o/newdelhi.jpg?alt=media&token=e8a4f233-586a-4076-95f1-d1e4b3bc7c4e',
      city: 'New Delhi',
      country: 'India',
      description: 'Visit New Delhi for an amazing and unforgettable adventure.',
      activities: activities,
    ),
    Destination(
      imageUrl: 'https://firebasestorage.googleapis.com/v0/b/getx-travel-ui.appspot.com/o/saopaulo.jpg?alt=media&token=0ccef34b-a340-49eb-912e-1fcbe3feb365',
      city: 'Sao Paulo',
      country: 'Brazil',
      description: 'Visit Sao Paulo for an amazing and unforgettable adventure.',
      activities: activities,
    ),
    Destination(
      imageUrl: 'https://firebasestorage.googleapis.com/v0/b/getx-travel-ui.appspot.com/o/newyork.jpg?alt=media&token=58fcacee-a5a0-4268-8429-5e77be2e53c6',
      city: 'New York City',
      country: 'United States',
      description: 'Visit New York for an amazing and unforgettable adventure.',
      activities: activities,
    ),
  ];
  return destinations;
  }
}
