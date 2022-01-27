import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_travel_crud/models/user_model.dart';
import 'package:getx_travel_crud/repository/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

// TODO: Final, const, late 사용하는 시점.
class LoginController extends GetxController {
  static LoginController get to => Get.find();

  final signUpFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();
  late FocusNode checkPwFocus, pwFocus;
  late final signUpEmail, signUpPw, pwCheck, signInEmail, signInPw;

  //TODO: late 잘 사용해야한다..

  UserModel? userModel;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late Rxn<User?> _firebaseUser;

  final onLoading = false.obs;

  bool? isStoreId = false;
  int? selectedIndexGender = -1;

  String? gender;

  late final SharedPreferences prefs;

  @override
  void onInit() {
    super.onInit();
    print('init');
    pwFocus = FocusNode();
    checkPwFocus = FocusNode();
    signUpEmail = TextEditingController();
    signUpPw = TextEditingController();
    pwCheck = TextEditingController();
    signInEmail = TextEditingController();
    signInPw = TextEditingController();

    getLoginInfo();

    //TODO: [late] keyword 초기화 생각
    _firebaseUser = Rxn<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.userChanges());
    ever(_firebaseUser, _setInitialScreen);
  }

  @override
  void onClose() {
    super.onClose();
    signUpEmail.dispose();
    signUpPw.dispose();
    signInEmail.dispose();
    signInPw.dispose();
    pwCheck.dispose();
    pwFocus.dispose();
    checkPwFocus.dispose();
  }

  _setInitialScreen(User? user) async {
    print('setInit');
    //TODO: 기억하기.
    /// 로그인 할 때에 유저가 성별을 골랐는지 아닌지를 알아야 하는데 그러기 위해서는
    /// DB에 데이터를 저장시켜놓고 불러와야한다. local에서 이뤄지는건 어차피 반영 안됨.
    await getUserInfo();

    if (user == null) {
      Get.offAllNamed('/');
    } else if (userModel == null && user != null) {
      Get.toNamed('/login/gender');
    } else if (userModel != null && user != null) {
      signInClear();
      Get.offAllNamed('/home');
    }
  }

  Future<void> addToUserFinal() async {
    String uid = _auth.currentUser!.uid;
    _initializeUserModel(uid);
    _addUserToFireStore(uid);
  }

  //TODO: .then은 ()=> 아니면 무조건 리턴을 해줘야한다.
  //TODO: then은 리턴해주는거라서 await랑 같이 쓰면 좋지 않다.
  //TODO: await랑 then은 절대 같이 쓰지마..
  Future<void> _initializeUserModel(String uid) async {
    var ds = await FirebaseFirestore.instance.collection('user').doc(uid).get();
    userModel = UserModel.fromDocumentSnapshot(ds);
    update();
    signUpClear();
    Get.offAllNamed('/home');
  }

  void _addUserToFireStore(String uid) {
    FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .set({
          'uid': uid,
          'email': signUpEmail.text,
          'pw': signUpPw.text,
          'gender': gender,
        })
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to add user: $error'));
  }

  Future<void> getUserInfo() async {
    if (_auth.currentUser != null) {
      var uid = _auth.currentUser!.uid;
      //TODO: 우선 유저의 정보를 DB에서 받아와야한다.
      userModel = await AuthRepository().findUserByUid(uid);
    } else {
      return;
    }
  }

  Future<void> signIn() async {
    try {
      onLoading.toggle();
      await _auth.signInWithEmailAndPassword(
        email: signInEmail.text.trim(),
        password: signInPw.text.trim(),
      );
      storeId();
      onLoading.toggle();
    } on FirebaseAuthException catch (e) {
      print(e);
      onLoading.toggle();
      Get.snackbar('Sign in Falied', 'Try Again');
    }
  }

  void signOut() {
    try {
      _auth.signOut();
      // TODO: 유저를 update 시키면 UI에 반영이 바로 되기 때문에.. [update()]는 하면 안된다.
      // Getbuilder는 UPDATE 하면 UI에 바로 반영..!
      userModel = null;
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future<UserCredential?> signUp() async {
    try {
      onLoading.toggle();
      return await _auth.createUserWithEmailAndPassword(
        email: signUpEmail.text.trim(),
        password: signUpPw.text.trim(),
      ).then((result) {
        Get.snackbar(
          '회원가입 완료!',
          '회원가입이 완료되었습니다.',
          backgroundColor: Colors.white,
        );
        onLoading.toggle();
      });
    } on FirebaseAuthException catch (e) {
      onLoading.toggle();
      void errorToast(String message) {
        Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          fontSize: 16.0,
        );
      }

      switch (e.code) {
        case 'email-already-in-use':
          errorToast('이미 사용중인 이메일입니다');
          break;

        case 'invalid-email':
          errorToast('잘못된 이메일 형식입니다');
          break;

        case 'operation-not-allowed':
          errorToast('사용할 수 없는 방식입니다');
          break;

        case 'weak-password':
          errorToast('비밀번호 보안 수준이 너무 낮습니다');
          break;

        default:
          errorToast('알수없는 오류가 발생했습니다');
      }
    }
    return null;
  }

  void changeGender(int index) {
    if (index == 0) {
      gender = '남자';
    } else {
      gender = '여자';
    }
    update();
  }

  //TODO: Null 생각
  Future<void> getLoginInfo() async {
    prefs = await SharedPreferences.getInstance();
    signInEmail.text = prefs.getString('userEmail') ?? '';
    isStoreId = prefs.getBool('checkBoxValue') ?? false;
    update();
  }

  void signUpClear() {
    signUpEmail.clear();
    signUpPw.clear();
    pwCheck.clear();
  }

  void signInClear() {
    signInEmail.clear();
    signInPw.clear();
  }

  Future<void> rememberEmail() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString('userEmail', signInEmail.text);
    prefs.setBool('checkBoxValue', isStoreId!);
  }

  void storeId() {
    if (isStoreId!) {
      rememberEmail();
    } else {
      prefs.setString('userEmail', '');
      prefs.setBool('checkBoxValue', false);
    }
    update();
  }
}
