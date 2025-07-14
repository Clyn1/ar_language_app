import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class FruitLessonPage extends StatefulWidget {
  @override
  _FruitLessonPageState createState() => _FruitLessonPageState();
}

class _FruitLessonPageState extends State<FruitLessonPage> {
  final FlutterTts flutterTts = FlutterTts();

  final List<Map<String, String>> fruits = [
    {
      'name': 'Apple',
      'image': 'https://cdn-icons-png.flaticon.com/512/415/415682.png',
    },
    {
      'name': 'Strawberry',
      'image': 'https://cdn-icons-png.flaticon.com/512/590/590685.png',
    },
    {
      'name': 'Orange',
      'image': 'https://cdn-icons-png.flaticon.com/512/135/135620.png',
    },
  ];

  Future<void> speak(String text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5); // Slower for kids
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDE7F6),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("🍎 Learn Fruits", style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: fruits.length,
        itemBuilder: (context, index) {
          final fruit = fruits[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        fruit['image']!,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Text(
                        fruit['name']!,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.volume_up_rounded, size: 30, color: Colors.deepPurple),
                      onPressed: () => speak(fruit['name']!),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
