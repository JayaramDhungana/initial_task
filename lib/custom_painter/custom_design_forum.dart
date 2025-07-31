import 'package:flutter/material.dart';
import 'package:initial_task/screens/forum_screen.dart';

class CustomDesignForum extends StatelessWidget {
  const CustomDesignForum({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // height: MediaQuery.of(context).size.height * 0.3, 
        width: double.infinity,
        child: Stack(
          children: [
            CustomPaint(
              painter: ForumPainter(),
              size: Size(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * 0.3,
              ),
            ),
      
            Positioned(
              top: 10,
              left: 120,
              child: Text(
                "Forum Screen",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            // ForumScreen(),
      
          ],
        ),
      );
    
  }
}

class ForumPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    final path = Path();
    // paint.color = Colors.blue;
     paint.shader = LinearGradient(
      colors: [Colors.purpleAccent, Colors.red, Colors.yellow],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10;
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.05);
    path.quadraticBezierTo(
      size.width * 0.0,
      size.height * 0.20,
      size.width * 0.15,
      size.height * 0.24,
    );

    path.quadraticBezierTo(
      size.width * 0.20,
      size.height * 0.24,
      size.width * 0.25,
      size.height * 0.24,
    );
    path.lineTo(size.width * 0.85, size.height * 0.24);
    path.quadraticBezierTo(
      size.width * 0.95,
      size.height * 0.28,
      size.width * 1,
      size.height * 0.35,
    );
    path.lineTo(size.width * 1, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
