import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? uid;
  final String? email;
  final String? pw;
  final String? gender;
  UserModel({
    required this.uid,
    required this.email,
    required this.pw,
    required this.gender,
  });

  UserModel copyWith({
    String? uid,
    String? email,
    String? pw,
    String? gender,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      pw: pw ?? this.pw,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'pw': pw,
      'gender': gender,
    };
  }

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot ds) {
    return UserModel(
      uid: ds.id,
      email: ds['email'],
      pw: ds['pw'],
      gender: ds['gender'],
    );
  }
}
