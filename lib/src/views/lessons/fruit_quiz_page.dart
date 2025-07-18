import 'package:flutter/material.dart';

class FruitQuizPage extends StatefulWidget {
  @override
  _FruitQuizPageState createState() => _FruitQuizPageState();
}

class _FruitQuizPageState extends State<FruitQuizPage> {
  final List<Map<String, dynamic>> _questions = [
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

  int _currentQuestionIndex = 0;
  int _score = 0;

  void _checkAnswer(String selectedOption) {
    final correctAnswer = _questions[_currentQuestionIndex]['answer'];
    if (selectedOption == correctAnswer) {
      _score++;
    }

    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      _showResultDialog();
    }
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Quiz Completed!'),
        content: Text('You got $_score out of ${_questions.length} correct!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Back to previous screen
            },
            child: const Text('OK'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fruit Quiz'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${_currentQuestionIndex + 1}/${_questions.length}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Text(
              currentQuestion['question'],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ...currentQuestion['options'].map<Widget>((option) {
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () => _checkAnswer(option),
                  child: Text(option),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
