import 'package:flutter/material.dart';

class Test1View extends StatelessWidget {
  const Test1View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Container(
        height: 365,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            'assets/back.png',
          ),
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;

    //! TEST 1
    // final Path path = Path()
    //   ..lineTo(0, height)
    //   ..lineTo(width * 0.25, height * 0.8)
    //   ..lineTo(width * 0.5, height)
    //   ..lineTo(width * 0.75, height * 0.8)
    //   ..lineTo(width, height)
    //   ..lineTo(width, 0)
    //   ..close();

    //! TEST 2
    // path.lineTo(0.0, size.height);
    // var firstStartPoint = Offset(
    //   size.width / 4 - size.width / 8,
    //   size.height - 60,
    // );
    // var firstEndPoint = Offset(
    //   size.width / 4 + size.width / 8,
    //   size.height - 70,
    // );
    // path.quadraticBezierTo(
    //   firstStartPoint.dx,
    //   firstStartPoint.dy,
    //   firstEndPoint.dx,
    //   firstEndPoint.dy,
    // );
    // path.lineTo(size.width, 0);

    // path.close();

    //! TEST 3
    // final firstControlPoint = Offset(width * 0.25, height * 0.8);
    // final firstEndPoint = Offset(width * 0.5, height * 0.9);
    // final secondControlPoint = Offset(width * 0.75, height);
    // final secondEndPoint = Offset(width, height * 0.8);

    // Path path = Path()
    //   ..lineTo(0, width)
    //   ..quadraticBezierTo(
    //     firstControlPoint.dx,
    //     firstControlPoint.dy,
    //     firstEndPoint.dx,
    //     firstEndPoint.dy,
    //   )
    //   ..quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
    //       secondEndPoint.dx, secondEndPoint.dy)
    //   ..lineTo(width, height)
    //   ..lineTo(width, 0)
    //   ..close();

    Path path = Path()
      ..lineTo(0, height - 150)
      ..quadraticBezierTo(width / 3, height / 2, width / 2, height - 100)
      ..quadraticBezierTo(width - (width / 3), height, width, height - 50)
      ..lineTo(width, height)
      ..lineTo(width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
