import 'package:flutter/material.dart';
import 'lessons/fruit_lesson_page.dart';
import 'lessons/animals_lesson_page.dart';
import 'lessons/vehicles_lesson_page.dart';
import 'lessons/body_parts_lesson_page.dart';

class LessonCategories extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Fruits',
      'icon': Icons.apple,
      'color': Color(0xFFFBE9E7),
      'iconColor': Colors.red,
    },
    {
      'title': 'Animals',
      'icon': Icons.pets,
      'color': Color(0xFFFFF3E0),
      'iconColor': Colors.deepOrange,
    },
    {
      'title': 'Objects',
      'icon': Icons.chair_alt,
      'color': Color(0xFFE0F2F1),
      'iconColor': Colors.teal,
    },
    {
      'title': 'Colors',
      'icon': Icons.color_lens,
      'color': Color(0xFFF3E5F5),
      'iconColor': Colors.purple,
    },
    {
      'title': 'Vehicles',
      'icon': Icons.directions_car,
      'color': Color(0xFFE3F2FD),
      'iconColor': Colors.blue,
    },
    {
      'title': 'Body Parts',
      'icon': Icons.accessibility_new,
      'color': Color(0xFFE8F5E9),
      'iconColor': Colors.green,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF7F0FA),
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final category = categories[index];

          return GestureDetector(
            onTap: () {
              // ✅ Route matching
              if (category['title'] == 'Fruits') {
                Navigator.push(context, MaterialPageRoute(builder: (_) => FruitLessonPage()));
              } else if (category['title'] == 'Animals') {
                Navigator.push(context, MaterialPageRoute(builder: (_) => AnimalsLessonPage()));
              } else if (category['title'] == 'Vehicles') {
                Navigator.push(context, MaterialPageRoute(builder: (_) => VehiclesLessonPage()));
              } else if (category['title'] == 'Body Parts') {
                Navigator.push(context, MaterialPageRoute(builder: (_) => BodyPartsLessonPage()));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${category['title']} tapped!')),
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: category['color'],
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    category['icon'],
                    size: 48,
                    color: category['iconColor'],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    category['title'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
