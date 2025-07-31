import 'package:flutter/material.dart';

class ClipperDesign2 extends StatelessWidget {
  const ClipperDesign2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Clipper Learning")),
      body: ClipPath(
        clipper: MyClipDesign(),
        child: Container(
          color: Colors.blue,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
        ),
      ),
    );
  }
}

class MyClipDesign extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final width = size.width;
    final height = size.height;
    path.lineTo(0, height * 0.7);
    path.quadraticBezierTo(
      width * 0.1,
      height * 0.8,
      width * 0.2,
      height * 0.6,
    );
    path.quadraticBezierTo(
      width * 0.3,
      height * 0.8,
      width * 0.4,
      height * 0.6,
    );
    path.quadraticBezierTo(
      width * 0.5,
      height * 0.8,
      width * 0.6,
      height * 0.6,
    );
    path.quadraticBezierTo(
      width * 0.7,
      height * 0.8,
      width * 0.8,
      height * 0.6,
    );
    path.quadraticBezierTo(width * 0.9, height * 0.8, width * 1, height * 0.7);

    path.lineTo(width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
