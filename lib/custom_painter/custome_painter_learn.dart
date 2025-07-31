import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class CustomePainterLearn extends StatefulWidget {
  const CustomePainterLearn({super.key});

  @override
  State<CustomePainterLearn> createState() => _CustomePainterLearnState();
}

class _CustomePainterLearnState extends State<CustomePainterLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Custom Painter")),
      body: Center(
        child: Container(
          color: Colors.grey.shade300,

          child: CustomPaint(painter: MasterPainter(), size: Size(300, 400)),
        ),
      ),
    );
  }
}

class MasterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.strokeWidth = 3;
      paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    Offset center = Offset(size.width / 2, size.height / 2);

    //this is code for generate line
    // canvas.drawLine(Offset.zero, Offset(0, size.height), paint);

    //this is code for generate circle
    // canvas.drawCircle(Offset(size.width / 2, size.height / 2), 40, paint);

    /**Following is for drawing Rectangle */
    // canvas.drawRect(
    //   Rect.fromCenter(center: center, width: 100, height: 200),
    //   paint,
    // );
    // canvas.drawRect(Rect.fromLTWH(90, 120, 80, 70), paint);
    // canvas.drawRect(Rect.fromLTRB(80, 30, 200, 120), paint);

    /**Draw a oval */
    // canvas.drawOval(Rect.fromLTRB(10, 20, 100, 200), paint);

    /**Draw rounded rectangle
    */
    Rect rect = Rect.fromLTRB(10, 20, 100, 200);
    //This makes all corner rectangular
    // canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(16)), paint);
    // canvas.drawRRect(
    //   RRect.fromRectAndCorners(
    //     rect,
    //     bottomLeft: Radius.circular(16),
    //     bottomRight: Radius.circular(16),
    //   ),
    //   paint,
    // );
    // Rect bigRect = Rect.fromLTRB(10, 20, 100, 200);
    // Rect smallRect = Rect.fromLTRB(20, 30, 100, 180);

    // RRect bigRRect = RRect.fromRectXY(bigRect, 75, 25);
    // RRect smallRRect = RRect.fromRectXY(smallRect, 75, 25);
    // canvas.drawDRRect(bigRRect, smallRRect, paint);

    //Fill Canvas color
    // canvas.drawColor(Colors.indigo, BlendMode.srcIn);

    //Fill gradient Color
    // paint.shader = ui.Gradient.linear(
    //   Offset.zero,
    //   Offset(size.width, size.height),
    //   [Colors.green, Colors.red],
    // );
    // canvas.clipRect(Offset.zero & size);
    // canvas.drawPaint(paint);

    //Points anusarko figure draw garna ko lagi
    final List<Offset> points = <Offset>[
      Offset.zero,
      Offset(size.width, 0),
      Offset(size.width / 2, size.height / 2),
      Offset.zero,
    ];

    canvas.drawPoints(ui.PointMode.polygon, points, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw false;
  }
}
