import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class FruitLessonPage extends StatefulWidget {
  @override
  _FruitLessonPageState createState() => _FruitLessonPageState();
}

class _FruitLessonPageState extends State<FruitLessonPage> {
  final FlutterTts flutterTts = FlutterTts();

  final String fruitName = "Apple";
  final String fruitDescription = "Apples are rich in fiber and vitamin C. They are good for your heart and help with digestion.";

  Future<void> _speak() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(fruitName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(fruitName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Placeholder for image or AR object
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                Icons.apple,
                size: 100,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 24),

            // Fruit name
            Text(
              fruitName,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            // Description
            Text(
              fruitDescription,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 32),

            // Listen button
            ElevatedButton.icon(
              onPressed: _speak,
              icon: Icon(Icons.volume_up),
              label: Text("Listen"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
