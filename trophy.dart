import 'dart:math';

import 'package:flutter/material.dart';

class TrophyScreen extends StatelessWidget {
  const TrophyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ICC Trophy'),
      ),
      body: const Center(child: TrophyWidget()),
    );
  }
}

class TrophyWidget extends StatelessWidget {
  const TrophyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: CustomPaint(painter: TrophyPainter()),
    );
  }
}

class TrophyPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint leg=Paint()..color=Colors.grey..style=PaintingStyle.fill;
    Rect leg1=Rect.fromPoints(const Offset(0, 30), const Offset(60, 300));
    canvas.drawArc(leg1, pi/2, pi, true, leg);

    Rect leg2=Rect.fromPoints(const Offset(140, 30), const Offset(200, 300));
    canvas.drawArc(leg2, 3*pi/2, pi, true, leg);

    Rect leg3=Rect.fromPoints(const Offset(80, 30),const Offset(120, 300));
    canvas.drawRect(leg3,leg);

    Paint headCircle=Paint()..color=Colors.yellowAccent..style=PaintingStyle.fill;
    canvas.drawCircle(Offset(size.width/2,0), 100 , headCircle);

    Paint bodyPaint=Paint()..color=Colors.black..style=PaintingStyle.fill;
    Rect bodyRect=Rect.fromPoints(const Offset(-30, -30),const Offset(230, 30));
    canvas.drawRect(bodyRect, bodyPaint);

    Paint bottom=Paint()..color=const Color.fromRGBO(0, 0, 0, 0.7)..style=PaintingStyle.fill;
    Rect bottomRect=Rect.fromPoints(const Offset(-30, 280), const Offset(230, 330));
    canvas.drawOval(bottomRect, bottom);



  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}