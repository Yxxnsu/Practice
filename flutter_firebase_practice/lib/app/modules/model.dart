import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeModel {
  String? docId;
  String? name;
  String? address;

  EmployeeModel({this.docId, this.address, this.name});

  EmployeeModel.fromSnapshot(DocumentSnapshot ds) {
    docId = ds.id;
    name = ds["name"];
    address = ds["address"];
  }
}
