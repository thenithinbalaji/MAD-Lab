import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(RandomGameGeneratorApp());
}

class RandomGameGeneratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Game Generator',
      home: RandomGameGeneratorScreen(),
    );
  }
}

class RandomGameGeneratorScreen extends StatefulWidget {
  @override
  _RandomGameGeneratorScreenState createState() => _RandomGameGeneratorScreenState();
}

class _RandomGameGeneratorScreenState extends State<RandomGameGeneratorScreen> {
  int diceResult = 1;

  void rollDice() {
    setState(() {
      diceResult = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Game Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150.0,
              height: 150.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: Center(
                child: Text(
                  '$diceResult',
                  style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: rollDice,
              child: Text('Roll the Dice'),
            ),
          ],
        ),
      ),
    );
  }
}
