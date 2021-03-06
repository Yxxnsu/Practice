import 'package:flutter/material.dart';

class Ticket extends StatelessWidget {
  const Ticket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Ticket'),
      ),
      body: Center(
        child: FlutterTicketWidget(
          width: 320,
          height: 700,
          isCornerRounded: true,
          child: Column(
            children: [
              Expanded(
                child: Align(
                  alignment: const Alignment(0, 0.337),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        60,
                        (index) => Container(
                          width: 3,
                          height: 2,
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FlutterTicketWidget extends StatefulWidget {
  final double width;
  final double height;
  final Widget child;
  final Color color;
  final bool isCornerRounded;

  const FlutterTicketWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.child,
    this.color = Colors.white,
    this.isCornerRounded = false,
  });

  @override
  _FlutterTicketWidgetState createState() => _FlutterTicketWidgetState();
}

class _FlutterTicketWidgetState extends State<FlutterTicketWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TicketClipper(),
      child: AnimatedContainer(
        duration: const Duration(seconds: 3),
        width: widget.width,
        height: widget.height,
        child: widget.child,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: widget.isCornerRounded
              ? BorderRadius.circular(23.0)
              : BorderRadius.circular(0.0),
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(
      Rect.fromCircle(
        center: Offset(0.0, size.height / 1.5),
        radius: 20.0,
      ),
    );
    path.addOval(
      Rect.fromCircle(
        center: Offset(size.width, size.height / 1.5),
        radius: 20.0,
      ),
    );

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
