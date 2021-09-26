import 'package:flutter/material.dart';
import 'package:flutter_email_notifier/firebase_provider.dart';
import 'package:flutter_email_notifier/signup_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pw = TextEditingController();
  bool remember = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late FirebaseProvider fp;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRememberInfo();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _pw.dispose();
  }

  @override
  Widget build(BuildContext context) {
    fp = Provider.of<FirebaseProvider>(context);
    logger.d(fp.getUser());
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Sign In'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              children: <Widget>[
                //Header
                Container(
                  height: 50,
                  decoration: const BoxDecoration(color: Colors.amber),
                  child: const Center(
                    child: Text(
                      "Sign In to Your Account",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Input Area
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.amber, width: 1),
                  ),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: _email,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          hintText: "Email",
                        ),
                      ),
                      TextField(
                        controller: _pw,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: "Password",
                        ),
                        obscureText: true,
                      ),
                    ].map((c) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: c,
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
          // Remember Me
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: <Widget>[
                Checkbox(
                  value: remember,
                  onChanged: (value) {
                    setState(() {
                      remember = value!;
                    });
                  },
                ),
                Text("Remember Me")
              ],
            ),
          ),

          // Alert Box
          (fp.getUser() != null && fp.getUser().emailVerified == false)
              ? Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(color: Colors.red[300]),
                  child: Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Mail authentication did not complete."
                          "\nPlease check your verification email.",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      RaisedButton(
                        color: Colors.lightBlue[400],
                        textColor: Colors.white,
                        child: const Text("Resend Verify Email"),
                        onPressed: () {
                          FocusScope.of(context).requestFocus(
                            FocusNode(),
                          ); // 키보드 감춤
                          fp.getUser().sendEmailVerification();
                        },
                      )
                    ],
                  ),
                )
              : Container(),

          // Sign In Button
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: RaisedButton(
              color: Colors.indigo[300],
              child: const Text(
                "SIGN IN",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                FocusScope.of(context).requestFocus(FocusNode()); // 키보드 감춤
                _signIn();
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Need an account?",
                  style: TextStyle(color: Colors.blueGrey),
                ),
                FlatButton(
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _signIn() async {
    _scaffoldKey.currentState!
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 10),
          content: Row(
            children: const <Widget>[
              CircularProgressIndicator(),
              Text("   Signing-In...")
            ],
          ),
        ),
      );
    bool result = await fp.signInWithEmail(_email.text, _pw.text);
    _scaffoldKey.currentState!.hideCurrentSnackBar();
    if (result == false) showLastFBMessage();
  }

  getRememberInfo() async {
    logger.d(remember);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      remember = (prefs.getBool("doRemember") ?? false);
    });
    if (remember) {
      setState(() {
        _email.text = (prefs.getString("userEmail") ?? "");
        _pw.text = (prefs.getString("userPasswd") ?? "");
      });
    }
  }

  setRememberInfo() async {
    logger.d(remember);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("doRemember", remember);
    if (remember) {
      prefs.setString("userEmail", _email.text);
      prefs.setString("userPasswd", _pw.text);
    }
  }

  showLastFBMessage() {
    _scaffoldKey.currentState!
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: Colors.red[400],
          duration: const Duration(seconds: 10),
          content: Text(fp.getFBMessage()),
          action: SnackBarAction(
            label: "Done",
            textColor: Colors.white,
            onPressed: () {},
          ),
        ),
      );
  }
}
