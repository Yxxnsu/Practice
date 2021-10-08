import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference product =
        FirebaseFirestore.instance.collection('product');
    CollectionReference product2 =
        FirebaseFirestore.instance.collection('prodcut2');
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.width / 8,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                product.add({
                  'id': 'hello',
                  'name': 'yxxnsy',
                  'created': FieldValue.serverTimestamp(),
                  'modified': FieldValue.serverTimestamp(),
                });
              },
              child: Text('Add product'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Add product'),
            ),
          ],
        ),
      ),
    );
  }
}
