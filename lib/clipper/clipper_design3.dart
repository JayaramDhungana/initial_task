import 'package:flutter/material.dart';

class ClipperDesign3 extends StatelessWidget {
  const ClipperDesign3({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          
          ClipPath(
            clipper: DesigningClip(),
            child: Container(
              color: Colors.blue,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ),
          Positioned(
            top: 40,
            left: 150,
            child: Text("Forum",style: TextStyle(color: Colors.white,
            fontSize: 40
            ),)),
        ],
      ),
    );
  }
}

class DesigningClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final height = size.height;
    final width = size.width;
    path.lineTo(0, height * 0.50);
    path.quadraticBezierTo(
      width * 0.05,
      height * 0.75,
      width * 0.2,
      height * 0.8,
    );
    path.lineTo(width * 0.85, height * 0.8);
    path.quadraticBezierTo(
      width ,
       height * 0.9,
        width,
         height);
     path.lineTo(width ,0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
