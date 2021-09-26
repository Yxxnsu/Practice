import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

Logger logger = Logger();

class FirebaseProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  String _FirebaseResponse = "";

  FirebaseProvider() {
    logger.d('init FirebaseProvider');
    _prepareUser();
  }

  User getUser() {
    return _user!;
  }

  void setUser(User? user) {
    _user = user;
    notifyListeners();
  }

  Future<void> _prepareUser() async {
    User? user = await _auth.currentUser;
    setUser(user!);
  }

  Future<bool> signUpWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (result.user != null) {
        result.user!.sendEmailVerification();
        signOut();
        return true;
      }
    } on Exception catch (e) {
      logger.e(e.toString());
      List<String> result = e.toString().split(", ");
      setFBMessage(result[1]);
      return false;
    }
    return false;
  }

  Future<bool> signInWithEmail(String email, String password) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (result != null) {
        setUser(result.user);
        logger.d(getUser());
        return true;
      }
      return false;
    } on Exception catch (e) {
      logger.e(e.toString());
      List<String> result = e.toString().split(", ");
      setFBMessage(result[1]);
      return false;
    }
  }

  signOut() async {
    await _auth.signOut();
    setUser(null);
  }

  sendPasswordResetEmail() async {
    await _auth.setLanguageCode("ko");
    sendPasswordResetEmail();
  }

  // Firebase로부터 회원 탈퇴
  withdrawalAccount() async {
    await getUser().delete();
    setUser(null);
  }

  // Firebase로부터 수신한 메시지 설정
  setFBMessage(String msg) {
    _FirebaseResponse = msg;
  }

  // Firebase로부터 수신한 메시지를 반환하고 삭제
  getFBMessage() {
    String returnValue = _FirebaseResponse;
    _FirebaseResponse = "";
    return returnValue;
  }
}
