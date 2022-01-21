import 'package:flutter/material.dart';
import 'dart:async';

// class Woodys extends StatefulWidget {
//   @override
//   _MyApp5State createState() => _MyApp5State();
// }

// class _MyApp5State extends State<Woodys> with SingleTickerProviderStateMixin {
//   Animation<Offset>? customDrawer;
//   AnimationController? customDrawerCt;

//   @override
//   void initState() {
//     customDrawerCt = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 300));
//     customDrawerCt!.addListener(() {
//       setState(() {});
//     });
//     customDrawer = Tween(begin: Offset(0, 0), end: Offset(1, 0))
//         .animate(customDrawerCt!);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             child: Center(
//               child: IconButton(
//                 icon: const Icon(Icons.menu),
//                 onPressed: () {
//                   customDrawerCt!.status.index == 3
//                     ? customDrawerCt!.reverse()
//                     : customDrawerCt!.forward();
//                 },
//               ),
//             ),
//           ),
//           SlideTransition(
//             position: customDrawer!,
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                     flex: 3,
//                     child: GestureDetector(
//                       onTap: () {
//                         customDrawerCt!.reverse();
//                       },
//                       child: Container(
//                           color: customDrawerCt!.isCompleted
//                               ? Colors.grey[300]
//                               : null),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 7,
//                     child: Container(
//                       color: Colors.amberAccent,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Woodys extends StatefulWidget {
//   const Woodys({ Key? key }) : super(key: key);

//   @override
//   _WoodyState createState() => _WoodyState();
// }

// class _WoodyState extends State<Woodys> with SingleTickerProviderStateMixin{

//   Animation<Offset>? animation;
//   AnimationController? animationController;

//   @override
//   void initState() {
//     animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
//     animation = Tween<Offset>(
//       begin: const Offset(0,-0.2),
//       end: const Offset(0,0)
//     ).animate(
//       CurvedAnimation(
//         parent: animationController!,
//         curve: Curves.fastLinearToSlowEaseIn)
//     );

//     Future<void>.delayed(const Duration(seconds: 2), (){
//       animationController!.repeat();
//     });
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           SlideTransition(
//             position: animation!,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const <Widget>[
//                 CircleAvatar(
//                   backgroundColor: Colors.green,
//                   radius: 50,
//                 )
//               ],
//             ),
//           )
//         ]
//       )
//     );
//   }
// }

// class Woodys extends StatelessWidget {
//   const Woodys({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: Future.delayed(
//           const Duration(seconds: 5),
//         ),
//         builder: (context, s) => s.connectionState == ConnectionState.done ?
//         Container(
//           color: Colors.amber,
//         )
//         : const Center(
//           child: CircularProgressIndicator(
//             color: Colors.amber,
//           )
//         ),
//       )
//     );
//   }
// }

class Woodys extends StatelessWidget {
  const Woodys({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 8,
          left: 16,
          right: 16,
        ),
        child: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        width: 180,
                        height: 180,
                        color: Colors.amber,
                      );
                    },
                  )
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        width: 180,
                        height: 180,
                        color: Colors.amber,
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
