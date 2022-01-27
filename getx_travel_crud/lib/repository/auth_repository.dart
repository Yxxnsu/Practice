import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getx_travel_crud/models/user_model.dart';

class AuthRepository{
  final _userCollection = FirebaseFirestore.instance.collection('user');

  Future<UserModel?> findUserByUid(String uid) async {
    try{
      var user = await _userCollection.where('uid', isEqualTo: uid).get();
      if(user.size == 0) return null;
      return UserModel.fromDocumentSnapshot(user.docs[0]);
    } catch(e){
      return null;
    }
  }
} 