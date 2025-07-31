import 'package:flutter/material.dart';

class CustomPainterDesign1 extends StatelessWidget {
  const CustomPainterDesign1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Positioned(
                // top: 90,
                // right: 0,
                child: CustomPaint(
                  size: Size(MediaQuery.of(context).size.width, 200),
                  painter: MyPainter(),
                ),
              ),
               SizedBox(height: 20,),
              Positioned(
                // top: 90,
                // right: 0,
                child: CustomPaint(
                  size: Size(MediaQuery.of(context).size.width, 200),
                  painter: MyPainter(),
                ),
              ),

              Positioned(
                top: 80,
                left: 70,
                child: Text(
                  "Forum Screen",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    final path = Path();
    // paint.color = Colors.green;
    paint.shader = LinearGradient(
      colors: [Colors.purpleAccent, Colors.red, Colors.yellow],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10;
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.90);
    path.quadraticBezierTo(
      size.width * 0.1,
      size.height * 0.75,
      size.width * 0.2,
      size.height * 0.90,
    );
    path.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.75,
      size.width * 0.4,
      size.height * 0.90,
    );
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.75,
      size.width * 0.6,
      size.height * 0.90,
    );
    path.quadraticBezierTo(
      size.width * 0.7,
      size.height * 0.75,
      size.width * 0.8,
      size.height * 0.90,
    );
    path.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.75,
      size.width * 1.0,
      size.height * 0.90,
    );
    path.lineTo(size.width * 1, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);

    final paintStroke = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    canvas.drawPath(path, paintStroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}
