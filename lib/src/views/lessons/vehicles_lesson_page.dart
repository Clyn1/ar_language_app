import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class VehiclesLessonPage extends StatefulWidget {
  @override
  State<VehiclesLessonPage> createState() => _VehiclesLessonPageState();
}

class _VehiclesLessonPageState extends State<VehiclesLessonPage> {
  final FlutterTts flutterTts = FlutterTts();

  final List<Map<String, String>> vehicles = [
    {
      'name': 'Car',
      'image': 'https://cdn-icons-png.flaticon.com/512/743/743131.png',
    },
    {
      'name': 'Bus',
      'image': 'https://cdn-icons-png.flaticon.com/512/616/616430.png',
    },
    {
      'name': 'Bicycle',
      'image': 'https://cdn-icons-png.flaticon.com/512/854/854878.png',
    },
    {
      'name': 'Airplane',
      'image': 'https://cdn-icons-png.flaticon.com/512/2304/2304832.png',
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
      backgroundColor: Color(0xFFE3F2FD),
      appBar: AppBar(
        title: Text("🚗 Learn Vehicles"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: vehicles.length,
        itemBuilder: (context, index) {
          final vehicle = vehicles[index];
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
                      vehicle['image']!,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      vehicle['name']!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.volume_up, color: Colors.deepPurple),
                    onPressed: () => speak(vehicle['name']!),
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
