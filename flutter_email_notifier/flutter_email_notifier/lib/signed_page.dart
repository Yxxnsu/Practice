import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_provider.dart';

class SignedInPage extends StatefulWidget {
  const SignedInPage({Key? key}) : super(key: key);

  @override
  _SignedInPageState createState() => _SignedInPageState();
}

class _SignedInPageState extends State<SignedInPage> {
  late FirebaseProvider fp;
  TextStyle tsItem = const TextStyle(
    color: Colors.blueGrey,
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );
  TextStyle tsContent = const TextStyle(
    color: Colors.blueGrey,
    fontSize: 12,
  );

  @override
  Widget build(BuildContext context) {
    fp = Provider.of<FirebaseProvider>(context);

    double propertyWith = 130;
    return Scaffold(
      appBar: AppBar(title: const Text("Singed In Page")),
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Column(
              children: <Widget>[
                //Hader
                Container(
                  height: 50,
                  decoration: const BoxDecoration(color: Colors.amber),
                  child: const Center(
                    child: Text(
                      "Signed In User Info",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // User's Info Area
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.amber,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: propertyWith,
                            child: Text("UID", style: tsItem),
                          ),
                          Expanded(
                            child: Text(
                              fp.getUser().uid,
                              style: tsContent,
                            ),
                          )
                        ],
                      ),
                      const Divider(height: 1),
                      Row(
                        children: <Widget>[
                          Container(
                            width: propertyWith,
                            child: Text(
                              "Email",
                              style: tsItem,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              fp.getUser().email!,
                              style: tsContent,
                            ),
                          )
                        ],
                      ),
                      const Divider(height: 1),
                      Row(
                        children: <Widget>[
                          Container(
                            width: propertyWith,
                            child: Text("Name", style: tsItem),
                          ),
                          Expanded(
                            child: Text(
                              fp.getUser().displayName ?? "",
                              style: tsContent,
                            ),
                          )
                        ],
                      ),
                      const Divider(height: 1),
                      Row(
                        children: <Widget>[
                          Container(
                            width: propertyWith,
                            child: Text("Phone Number", style: tsItem),
                          ),
                          Expanded(
                            child: Text(
                              fp.getUser().phoneNumber ?? "",
                              style: tsContent,
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 1),
                      Row(
                        children: <Widget>[
                          Container(
                            width: propertyWith,
                            child: Text("isEmailVerified", style: tsItem),
                          ),
                          Expanded(
                            child: Text(fp.getUser().emailVerified.toString(),
                                style: tsContent),
                          )
                        ],
                      ),
                      const Divider(height: 1),
                      Row(
                        children: <Widget>[
                          Container(
                            width: propertyWith,
                            child: Text("Provider ID", style: tsItem),
                          ),
                          Expanded(
                            child: Text(fp.getUser().uid, style: tsContent),
                          )
                        ],
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

          // Sign In Button
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: RaisedButton(
              color: Colors.indigo[300],
              child: const Text(
                "SIGN OUT",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                fp.signOut();
              },
            ),
          ),

          // Send Password Reset Email by Korean
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 0),
            child: RaisedButton(
              color: Colors.orange[300],
              child: const Text(
                "Send Password Reset Email by Korean",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                fp.sendPasswordResetEmail();
              },
            ),
          ),

          // Send Password Reset Email by Korean
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: RaisedButton(
              color: Colors.red[300],
              child: const Text(
                "Withdrawal (Delete Account)",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                fp.withdrawalAccount();
              },
            ),
          ),
        ],
      ),
    );
  }
}
