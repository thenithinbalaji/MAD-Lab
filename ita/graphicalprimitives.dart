import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Shapes extends StatelessWidget {
  const Shapes ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shapes Page'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: CustomPaint(
          painter: ShapesPainter(),
          size: Size(300, 300), // Adjust the canvas size as needed
        ),
      ),
      ),
    );
  }
}

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    // Calculate the center of the canvas
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    // Draw a circle
    paint.color = Colors.blue;
    canvas.drawCircle(Offset(centerX, centerY), 50.0, paint);
    // Draw a rectangle
    paint.color = Colors.red;
    final rect = Rect.fromCenter(
      center: Offset(centerX, centerY + 100.0), // Adjust position as needed
      width: 100.0,
      height: 50.0,
    );
    canvas.drawRect(rect, paint);
    // Draw a square
    paint.color = Colors.green;
    final squareSize = 80.0;
    final squareRect = Rect.fromCenter(
      center: Offset(centerX, centerY - 100.0), // Adjust position as needed
      width: squareSize,
      height: squareSize,
    );
    canvas.drawRect(squareRect, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
