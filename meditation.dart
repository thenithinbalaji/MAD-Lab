import 'package:flutter/material.dart';
import 'dart:math';
void main()
{
  runApp(meditationapp());
}
class meditationapp extends StatelessWidget {
  const meditationapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:MyHomeApp(),
    );
  }
}
class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});

  @override
  State<MyHomeApp> createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  Color? bgColor=Colors.blueAccent[100];
  void changeColor()
  {
    setState(() {
      bgColor=Colors.amberAccent;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('meditation app'),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to app',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(onPressed: changeColor, child: Text('change bg'))
            ],
          )
        )
      ),
    );
  }
}

