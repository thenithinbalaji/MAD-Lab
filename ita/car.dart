import 'package:flutter/material.dart';

class CarScreen extends StatelessWidget {
  const CarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrr'),
      ),
      body: const Center(child: CarWidget()),
    );
  }
}

class CarWidget extends StatefulWidget {
  const CarWidget({super.key});

  @override
  State<CarWidget> createState() => _CarWidgetState();
}

class _CarWidgetState extends State<CarWidget> {
  Color carColor=Colors.red;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: CarPainter(carColor: carColor),
          ),
        ),
        const SizedBox(height: 30),

        ElevatedButton(onPressed: () {
          setState(() {
            carColor==Colors.red?carColor=Colors.blue:carColor=Colors.red;
          });
        }, child: const Text('Change Color of the car')),
      ],
    );
  }
}

class CarPainter extends CustomPainter {
  final Color carColor;
  const CarPainter({required this.carColor});
  @override
  void paint(Canvas canvas, Size size) {
    Paint body=Paint()..color=carColor..style=PaintingStyle.fill;
    Rect bodyRect=Rect.fromPoints(const Offset(0,0),const Offset(300, 80));
    canvas.drawRect(bodyRect, body);

    Paint wheelColor=Paint()..color=Colors.black..style=PaintingStyle.fill;
    canvas.drawCircle(const Offset(60, 80), 30, wheelColor);
    canvas.drawCircle(const Offset(240, 80), 30, wheelColor);

    Path topPart=Path()..moveTo(60, 0)..lineTo(240, 0)..lineTo(200, -40)..lineTo(100, -40)..close();
    canvas.drawPath(topPart, body);
    Path topInnerPart=Path()..moveTo(80, -5)..lineTo(220, -5)..lineTo(195, -30)..lineTo(105, -30)..close();
    canvas.drawPath(topInnerPart, body..color=Colors.white);
  }

  @override
  bool shouldRepaint(covariant CarPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
