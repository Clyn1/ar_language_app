import 'package:flutter/material.dart';
import 'lessons/fruit_lesson_page.dart'; // ✅ Fruits lesson import
import 'lessons/animals_lesson_page.dart'; // ✅ Animals lesson import

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8EFFD), // Soft purple background
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
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
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
