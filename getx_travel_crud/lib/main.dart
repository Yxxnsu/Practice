import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:getx_travel_crud/start.dart';

void main() async {
  //TODO: 반드시 Firebase.initalizeApp이 뒤에 오기, 그리고 Firebase 공홈에서 했던거 생각! 그 podfile에 넣는거!
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
