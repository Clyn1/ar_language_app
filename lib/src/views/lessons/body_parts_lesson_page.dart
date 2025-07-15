import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class BodyPartsLessonPage extends StatefulWidget {
  @override
  State<BodyPartsLessonPage> createState() => _BodyPartsLessonPageState();
}

class _BodyPartsLessonPageState extends State<BodyPartsLessonPage> {
  final FlutterTts flutterTts = FlutterTts();

  final List<Map<String, String>> bodyParts = [
    {
      'name': 'Head',
      'image': 'https://cdn-icons-png.flaticon.com/512/3635/3635402.png',
    },
    {
      'name': 'Hand',
      'image': 'https://cdn-icons-png.flaticon.com/512/3566/3566340.png',
    },
    {
      'name': 'Leg',
      'image': 'https://cdn-icons-png.flaticon.com/512/942/942748.png',
    },
    {
      'name': 'Eye',
      'image': 'https://cdn-icons-png.flaticon.com/512/2343/2343969.png',
    },
  ];

  Future<void> speak(String text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8F5E9),
      appBar: AppBar(
        title: Text("🧠 Learn Body Parts"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: bodyParts.length,
        itemBuilder: (context, index) {
          final part = bodyParts[index];
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
                      part['image']!,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      part['name']!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.volume_up, color: Colors.deepPurple),
                    onPressed: () => speak(part['name']!),
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
