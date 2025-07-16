import 'package:flutter/material.dart';

class FruitQuizPage extends StatefulWidget {
  @override
  _FruitQuizPageState createState() => _FruitQuizPageState();
}

class _FruitQuizPageState extends State<FruitQuizPage> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Which one is a red fruit?',
      'options': ['Banana', 'Apple', 'Orange'],
      'answer': 'Apple',
    },
    {
      'question': 'Which fruit is yellow?',
      'options': ['Grapes', 'Banana', 'Blueberry'],
      'answer': 'Banana',
    },
  ];

  int currentQuestion = 0;
  int score = 0;

  void checkAnswer(String selected) {
    final correct = questions[currentQuestion]['answer'];
    if (selected == correct) {
      score++;
    }

    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
      });
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Quiz Completed!'),
          content: Text('You got $score out of ${questions.length} correct!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // close dialog
                Navigator.pop(context); // back to fruit lesson
              },
              child: Text('OK'),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];

    return Scaffold(
      appBar: AppBar(
        title: Text('Fruit Quiz'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              question['question'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            ...question['options'].map<Widget>((opt) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple,
                  onPrimary: Colors.white,
                  minimumSize: Size.fromHeight(50),
                ),
                onPressed: () => checkAnswer(opt),
                child: Text(opt),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
