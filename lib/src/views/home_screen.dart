import 'package:flutter/material.dart';
import 'package:ar_language_app/src/views/lessons/fruit_lesson_page.dart';
import 'package:ar_language_app/src/views/lessons/animals_lesson_page.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'title': 'Fruits', 'icon': Icons.apple},
    {'title': 'Animals', 'icon': Icons.pets},
    {'title': 'Objects', 'icon': Icons.category},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F1FF),
      appBar: AppBar(
        title: Text('Learn with AR'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final category = categories[index];
          final String title = category['title'].toString().toLowerCase();

          return GestureDetector(
            onTap: () {
              if (title == 'fruits') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => FruitLessonPage()),
                );
              } else if (title == 'animals') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AnimalsLessonPage()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${category['title']} tapped (not implemented yet)')),
                );
              }
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(category['icon'], size: 48, color: Colors.deepPurple),
                    SizedBox(height: 8),
                    Text(
                      category['title'],
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
