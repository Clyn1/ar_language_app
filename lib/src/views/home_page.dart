import 'package:flutter/material.dart';

// Import lesson pages
import 'lessons/fruit_lesson_page.dart';
import 'lessons/animals_lesson_page.dart';
import 'lessons/vehicles_lesson_page.dart';
import 'lessons/body_parts_lesson_page.dart';
import 'ar_flashcard_scanner.dart'; // ✅ Correct path since it's in the same folder
import 'lessons/fruit_quiz_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8EFFD),
      appBar: AppBar(
        title: const Text('Learn with AR'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: [
            _buildCategoryCard(
              icon: Icons.camera_alt,
              label: 'AR Flashcards',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ARFlashcardScanner()),
                );
              },
            ),
            _buildCategoryCard(
              icon: Icons.apple,
              label: 'Fruits',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => FruitLessonPage()),
                );
              },
            ),
            _buildCategoryCard(
              icon: Icons.pets,
              label: 'Animals',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AnimalsLessonPage()),
                );
              },
            ),
            _buildCategoryCard(
              icon: Icons.directions_car,
              label: 'Vehicles',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => VehiclesLessonPage()),
                );
              },
            ),
            _buildCategoryCard(
              icon: Icons.accessibility_new,
              label: 'Body Parts',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => BodyPartsLessonPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget builder for each category card
  Widget _buildCategoryCard({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 48, color: Colors.deepPurple),
              SizedBox(height: 10),
              Text(label, style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
