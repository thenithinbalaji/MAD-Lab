import 'package:flutter/material.dart';

void main() {
  runApp(CircleSizeChangeApp());
}

class CircleSizeChangeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circle Size Change App',
      home: CircleSizeChangeScreen(),
    );
  }
}

class CircleSizeChangeScreen extends StatefulWidget {
  @override
  _CircleSizeChangeScreenState createState() => _CircleSizeChangeScreenState();
}

class _CircleSizeChangeScreenState extends State<CircleSizeChangeScreen> {
  double circleSize = 100.0;

  void increaseSize() {
    setState(() {
      circleSize += 20.0;
    });
  }

  void decreaseSize() {
    setState(() {
      circleSize -= 20.0;
      if (circleSize < 20.0) {
        circleSize = 20.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circle Size Change App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: circleSize,
              height: circleSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: increaseSize,
                  child: Text('Increase Size'),
                ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: decreaseSize,
                  child: Text('Decrease Size'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
