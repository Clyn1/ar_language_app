import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AnimalsLessonPage extends StatefulWidget {
  @override
  State<AnimalsLessonPage> createState() => _AnimalsLessonPageState();
}

class _AnimalsLessonPageState extends State<AnimalsLessonPage> {
  final FlutterTts flutterTts = FlutterTts();

  final List<Map<String, String>> animals = [
    {
      'name': 'Dog',
      'image': 'https://cdn-icons-png.flaticon.com/512/616/616408.png',
    },
    {
      'name': 'Cat',
      'image': 'https://cdn-icons-png.flaticon.com/512/616/616430.png',
    },
    {
      'name': 'Elephant',
      'image': 'https://cdn-icons-png.flaticon.com/512/616/616556.png',
    },
    {
      'name': 'Lion',
      'image': 'https://cdn-icons-png.flaticon.com/512/616/616408.png',
    },
  ];

  Future<void> speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5); // slower for kids
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3E5F5),
      appBar: AppBar(
        title: Text("🐾 Learn Animals"),
        backgroundColor: Colors.deepPurple,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(fontSize: 22, color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: animals.length,
        itemBuilder: (context, index) {
          final animal = animals[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            elevation: 6,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      animal['image']!,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      animal['name']!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.volume_up, color: Colors.deepPurple),
                    onPressed: () => speak(animal['name']!),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
