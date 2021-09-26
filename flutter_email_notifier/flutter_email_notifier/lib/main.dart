import 'package:flutter/material.dart';
import 'package:flutter_email_notifier/firebase_provider.dart';
import 'package:flutter_email_notifier/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FirebaseProvider>(
          create: (context) => FirebaseProvider(),
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: HomeView(),
      ),
    );
  }
}
