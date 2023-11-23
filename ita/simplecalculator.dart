import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "";
  double _num1 = 0.0;
  double _num2 = 0.0;
  String _operation = "";
  void _buttonPressed(String buttonText) {
  if (buttonText == "C") {
    _output = "";
    _num1 = 0.0;
    _num2 = 0.0;
    _operation = "";
  } else if (buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "/") {
    _num1 = double.parse(_output);
    _operation = buttonText;
    _output = "$_num1 $_operation ";
  } else if (buttonText == "=") {
    _num2 = double.parse(_output.split(' ')[2]);
    switch (_operation) {
      case "+":
        _output += " = ${_num1 + _num2}";
        break;
      case "-":
        _output += " = ${_num1 - _num2}";
        break;
      case "x":
        _output += " = ${_num1 * _num2}";
        break;
      case "/":
        if (_num2 != 0) {
          _output += " = ${_num1 / _num2}";
        } else {
          _output = "Error";
        }
        break;
    }
    _num1 = 0.0;
    _num2 = 0.0;
    _operation = "";
  } else {
    if (_output == "0" || _output == "Error") {
      _output = buttonText;
    } else {
      _output += buttonText;
    }
  }
  setState(() {});
}
  
  Widget _buildButton(String buttonText, {Color? color}) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _buttonPressed(buttonText),
        style: ElevatedButton.styleFrom(
          primary: color ?? Colors.grey[300],
          padding: EdgeInsets.all(20.0),
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: TextStyle(fontSize: 48.0),
              ),
            ),
          ),
          Row(
            children: [
              _buildButton("7"),
              _buildButton("8"),
              _buildButton("9"),
              _buildButton("/", color: Colors.orange),
            ],
          ),
          Row(
            children: [
              _buildButton("4"),
              _buildButton("5"),
              _buildButton("6"),
              _buildButton("x", color: Colors.orange),
            ],
          ),
          Row(
            children: [
              _buildButton("1"),
              _buildButton("2"),
              _buildButton("3"),
              _buildButton("-", color: Colors.orange),
            ],
          ),
          Row(
            children: [
              _buildButton("0"),
              _buildButton("C"),
              _buildButton("="),
              _buildButton("+", color: Colors.orange),
            ],
          ),
        ],
      ), 
    );
  }
}
