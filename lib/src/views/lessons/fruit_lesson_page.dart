import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class FruitLessonPage extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  final List<String> fruits = ['Apple', 'Banana', 'Orange'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fruit Lesson")),
      body: ListView.builder(
        itemCount: fruits.length,
        itemBuilder: (context, index) {
          final fruit = fruits[index];
          return ListTile(
            title: Text(fruit),
            trailing: IconButton(
              icon: Icon(Icons.volume_up),
              onPressed: () {
                flutterTts.speak(fruit);
              },
            ),
          );
        },
      ),
    );
  }
}
