import 'package:flutter/material.dart';

class ClipperLearn extends StatefulWidget {
  const ClipperLearn({super.key});

  @override
  State<ClipperLearn> createState() => _ClipperLearnState();
}

class _ClipperLearnState extends State<ClipperLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipPath(
        clipper: MyClippper(),
        child: Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          color: Colors.orange,
          child: Center(child: Text("Hello")),
        ),
      ),
    );
  }
}

class MyClippper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);

    path.quadraticBezierTo(
      size.width*0.5,
      size.height*0.5,
      // size.height*0,
      size.width,
       size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
