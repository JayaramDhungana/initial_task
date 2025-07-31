import 'package:flutter/material.dart';

class CustomPainterDesign extends StatefulWidget {
  const CustomPainterDesign({super.key});

  @override
  State<CustomPainterDesign> createState() => _CustomPainterDesignState();
}

class _CustomPainterDesignState extends State<CustomPainterDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Painting Desing ")),
      body: Stack(
        children: [
          Column(
            children: [
              Text(
                "Learning Custom Painting",
                style: TextStyle(color: Colors.black),
              ),

              CustomPaint(painter: MyShape(), child: Container()),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 500),
              painter: MyShape(),
            ),
          ),
        ],
      ),
    );
  }
}

class MyShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    final path = Path();
    paint.color = Colors.lightGreen;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;
    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(
      size.width * 0.1,
      size.height * 0.78,
      size.width * 0.3,
      size.height * 0.89,
    );
    path.quadraticBezierTo(
      size.width * 0.45,
      size.height * 0.95,
      size.width * 0.6,
      size.height * 0.85,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.75,
      size.width * 0.85,
      size.height * 0.7,
    );
    path.quadraticBezierTo(
      size.width * 0.95,
      size.height * 0.65,
      size.width,
      size.height * 0.68,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.8);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}
