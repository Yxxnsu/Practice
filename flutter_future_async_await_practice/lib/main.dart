import 'package:flutter/material.dart';
// import 'package:flutter_application_1/info.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';

// void main() {
//   runApp(MyApp(
//     info: fetchInfo(),
//   ));
// }

// class MyApp extends StatelessWidget {
//   final Future<Info> info;
//   const MyApp({required this.info});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Fetch Data Example',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('계좌정보 확인하기'),
//           centerTitle: true,
//         ),
//         body: Center(
//           child: FutureBuilder<Info>(
//             future: info,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       '고객번호: ' + snapshot.data!.id.toString(),
//                       style: TextStyle(fontSize: 20.0),
//                     ),
//                     Text(
//                       '고객명: ' + snapshot.data!.userName.toString(),
//                       style: TextStyle(fontSize: 20.0),
//                     ),
//                     Text(
//                       '계좌 아이디: ' + snapshot.data!.account.toString(),
//                       style: TextStyle(fontSize: 20.0),
//                     ),
//                     Text(
//                       '잔액: ' + snapshot.data!.balance.toString() + '원',
//                       style: TextStyle(fontSize: 20.0),
//                     ),
//                   ],
//                 );
//               } else if (snapshot.hasError) {
//                 return Text("${snapshot.error}");
//               }
//               return CircularProgressIndicator(
//                 valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// Future<Info> fetchInfo() async {
//   final response = await http
//       .get(Uri.parse('https://my.api.mockaroo.com/bank.json?key=fea24270'));

//   if (response.statusCode == 200) {
//     print('계좌정보 불러오기 성공!');
//     return Info.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('계좌정보를 불러오는데 실패했습니다');
//   }
// }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String result = 'The data is not fetched';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Future Test'),
              onPressed: () {
                fetchData();
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              result,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Divider(
                height: 20,
                thickness: 2,
              ),
            ),
            FutureBuilder(
              future: myFuture(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    snapshot.data.toString(),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchData() async {
    await Future.delayed(Duration(seconds: 3)).then((value) {
      setState(() {
        result = 'The Data is fetched';
      });
    });
  }

  Future<String> myFuture() async {
    await Future.delayed(Duration(seconds: 3));
    return 'Another Future completed';
  }
}
