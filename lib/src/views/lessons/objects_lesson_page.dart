import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ObjectsLessonPage extends StatefulWidget {
  @override
  State<ObjectsLessonPage> createState() => _ObjectsLessonPageState();
}

class _ObjectsLessonPageState extends State<ObjectsLessonPage> {
  final FlutterTts flutterTts = FlutterTts();

  final List<Map<String, String>> objects = [
    {
      'name': 'Chair',
      'image': 'https://cdn-icons-png.flaticon.com/512/149/149446.png',
    },
    {
      'name': 'Table',
      'image': 'https://cdn-icons-png.flaticon.com/512/3952/3952411.png',
    },
    {
      'name': 'Book',
      'image': 'https://cdn-icons-png.flaticon.com/512/29/29302.png',
    },
    {
      'name': 'Pen',
      'image': 'https://cdn-icons-png.flaticon.com/512/4202/4202840.png',
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
      backgroundColor: Color(0xFFE0F2F1),
      appBar: AppBar(
        title: Text("🪑 Learn Objects"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: objects.length,
        itemBuilder: (context, index) {
          final obj = objects[index];
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
                      obj['image']!,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      obj['name']!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.volume_up, color: Colors.deepPurple),
                    onPressed: () => speak(obj['name']!),
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
