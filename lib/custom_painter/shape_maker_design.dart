import 'package:flutter/material.dart';

class ShapeMakerDesign extends StatefulWidget {
  const ShapeMakerDesign({super.key});

  @override
  State<ShapeMakerDesign> createState() => _ShapeMakerDesignState();
}

class _ShapeMakerDesignState extends State<ShapeMakerDesign> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CustomPaint(

        size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height*0.3),
        painter: RPSCustomPainter(),
      ),
    );
  }
}
class RPSCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  // Layer 1
  
  Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 59, 25, 242)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    Path path_0 = Path();
    path_0.moveTo(size.width*-0.0007917,size.height*0.0015333);
    path_0.quadraticBezierTo(size.width*0.0133750,size.height*0.3559167,size.width*0.0408167,size.height*0.4021500);
    path_0.cubicTo(size.width*0.0779167,size.height*0.4649333,size.width*0.0961917,size.height*0.4444500,size.width*0.1882833,size.height*0.4964333);
    path_0.cubicTo(size.width*0.3529000,size.height*0.5235333,size.width*0.7865833,size.height*0.4984000,size.width*0.8467500,size.height*0.5335333);
    path_0.quadraticBezierTo(size.width*0.8986417,size.height*0.5618667,size.width*1.0008333,size.height*0.8033333);
    path_0.lineTo(size.width*0.9991667,0);

    canvas.drawPath(path_0, paint_fill_0);
  

  // Layer 1
  
  Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    
    canvas.drawPath(path_0, paint_stroke_0);
  

  
    // Forum Screen
  
    canvas.save();
    final pivot_688788041839 = Offset(size.width*0.32,size.height*0.19); 
    canvas.translate(pivot_688788041839.dx,pivot_688788041839.dy);
    canvas.rotate(0);
    canvas.translate(-pivot_688788041839.dx,-pivot_688788041839.dy);
    TextPainter tp_688788041839 = TextPainter(
      text:  TextSpan(text: """Forum Screen""", style: TextStyle(
        fontSize: size.width*0.06,
        fontWeight: FontWeight.bold,
        color: Color(0xfff9f8f8),
        fontStyle: FontStyle.normal,
        decoration: TextDecoration.none,
      )),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    )..layout(maxWidth: size.width*0.41, minWidth: size.width*0.41);
    tp_688788041839.paint(canvas,pivot_688788041839);
    canvas.restore();
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
