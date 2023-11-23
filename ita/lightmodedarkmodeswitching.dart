import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Light/Dark Mode Switcher',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: LightDarkModeSwitcher(),
    );
  }
}

class LightDarkModeSwitcher extends StatefulWidget {
  @override
  _LightDarkModeSwitcherState createState() => _LightDarkModeSwitcherState();
}

class _LightDarkModeSwitcherState extends State<LightDarkModeSwitcher> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Light/Dark Mode Switcher'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        color: isDarkMode ? Colors.black : Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Switch between Light and Dark Modes',
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: toggleTheme,
                child: Text(
                  isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
