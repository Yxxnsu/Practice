import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_practice/app/modules/home/custom_dialog.dart';
import 'package:flutter_firebase_practice/app/modules/home/custom_snack_bar.dart';
import 'package:flutter_firebase_practice/app/modules/model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController, addressController;
  late CollectionReference collectionReference;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  RxList<EmployeeModel> employees = RxList<EmployeeModel>([]);

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    addressController = TextEditingController();
    collectionReference = firebaseFirestore.collection('employees');
    employees.bindStream(getAllEmployees());
  }

  Stream<List<EmployeeModel>> getAllEmployees() =>
      collectionReference.snapshots().map((query) =>
          query.docs.map((ds) => EmployeeModel.fromSnapshot(ds)).toList());

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Name can not be empty";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Address can not be empty";
    }
    return null;
  }

  void saveUpdateEmployee(
    String name,
    String address,
    String docId,
    int addEditFlag,
  ) {
    final isVaild = formKey.currentState!.validate();
    if (!isVaild) {
      return;
    }
    formKey.currentState!.save();
    if (addEditFlag == 1) {
      CustomDialog.showDialog();
      collectionReference
          .add({'name': name, 'address': address}).whenComplete(() {
        CustomDialog.dismiss();
        clearEditingControllers();
        Get.back();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Employee Added",
            message: "Employee added successfully",
            backgroundColor: Colors.green);
      }).catchError((error) {
        CustomDialog.dismiss();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Error",
            message: "Something went wrong",
            backgroundColor: Colors.green);
      });
    } else if (addEditFlag == 2) {
      //update
      CustomDialog.showDialog();
      collectionReference
          .doc(docId)
          .update({'name': name, 'address': address}).whenComplete(() {
        CustomDialog.dismiss();
        clearEditingControllers();
        Get.back();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Employee Updated",
            message: "Employee updated successfully",
            backgroundColor: Colors.green);
      }).catchError(
        (error) {
          CustomDialog.dismiss();
          CustomSnackBar.showSnackBar(
              context: Get.context,
              title: "Error",
              message: "Something went wrong",
              backgroundColor: Colors.red);
        },
      );
    }
  }

  void deleteData(String docId) {
    CustomDialog.showDialog();
    collectionReference.doc(docId).delete().whenComplete(() {
      CustomDialog.dismiss();
      Get.back();
      CustomSnackBar.showSnackBar(
        context: Get.context,
        title: "Employee Deleted",
        message: "Employee deleted successfully",
        backgroundColor: Colors.green,
      );
    }).catchError((error) {
      CustomDialog.dismiss();
      CustomSnackBar.showSnackBar(
        context: Get.context,
        title: "Error",
        message: "Something went wrong",
        backgroundColor: Colors.red,
      );
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    addressController.dispose();
    super.onClose();
  }

  void clearEditingControllers() {
    nameController.clear();
    addressController.clear();
  }
}
