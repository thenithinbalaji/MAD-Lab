import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Map<String, dynamic>> questions = [
    {
      'questionText': 'What is the capital of France?',
      'options': ['Berlin', 'Madrid', 'Paris'],
      'correctOption': 'Paris',
    },
    {
      'questionText': 'Which planet is known as the Red Planet?',
      'options': ['Earth', 'Mars', 'Jupiter'],
      'correctOption': 'Mars',
    },
    {
      'questionText': 'What is the largest mammal?',
      'options': ['Elephant', 'Blue Whale', 'Giraffe'],
      'correctOption': 'Blue Whale',
    },
  ];

  int currentQuestionIndex = 0;
  int score = 0;

  void checkAnswer(String selectedOption) {
    String correctOption = questions[currentQuestionIndex]['correctOption'] as String;

    setState(() {
      if (selectedOption == correctOption) {
        score++;
      }

      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      }
    });
  }

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[currentQuestionIndex]['questionText'] as String,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            ...(questions[currentQuestionIndex]['options'] as List<String>).map((option) {
              return ElevatedButton(
                onPressed: () => checkAnswer(option),
                child: Text(option),
              );
            }).toList(),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (currentQuestionIndex == questions.length - 1) {
                  // If it's the last question, show the score
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Quiz Completed'),
                        content: Text('Your Score: $score out of ${questions.length}'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              resetQuiz();
                            },
                            child: Text('Play Again'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  // Move to the next question
                  setState(() {
                    currentQuestionIndex++;
                  });
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
