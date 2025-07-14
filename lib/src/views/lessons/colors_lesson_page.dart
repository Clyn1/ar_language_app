import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ColorsLessonPage extends StatefulWidget {
  @override
  State<ColorsLessonPage> createState() => _ColorsLessonPageState();
}

class _ColorsLessonPageState extends State<ColorsLessonPage> {
  final FlutterTts flutterTts = FlutterTts();

  final List<Map<String, dynamic>> colors = [
    {'name': 'Red', 'color': Colors.red},
    {'name': 'Blue', 'color': Colors.blue},
    {'name': 'Green', 'color': Colors.green},
    {'name': 'Yellow', 'color': Colors.yellow[700]},
    {'name': 'Purple', 'color': Colors.purple},
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
      backgroundColor: Color(0xFFF3E5F5),
      appBar: AppBar(
        title: Text("🎨 Learn Colors"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final item = colors[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            elevation: 6,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: item['color'],
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black26),
                ),
              ),
              title: Text(
                item['name'],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurple,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.volume_up, color: Colors.deepPurple),
                onPressed: () => speak(item['name']),
              ),
            ),
          );
        },
      ),
    );
  }
}
