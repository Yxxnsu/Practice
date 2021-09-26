import 'package:flutter/material.dart';
import 'package:flutter_email_notifier/firebase_provider.dart';
import 'package:flutter_email_notifier/signed_page.dart';
import 'package:flutter_email_notifier/signin_page.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late FirebaseProvider fp;
  @override
  Widget build(BuildContext context) {
    fp = Provider.of<FirebaseProvider>(context);
    logger.d("user: ${fp.getUser()}");
    if (fp.getUser() != null && fp.getUser().emailVerified == true) {
      return const SignedInPage();
    } else {
      return const SignInView();
    }
  }
}
