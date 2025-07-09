import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'title': 'Fruits', 'icon': Icons.apple},
    {'title': 'Animals', 'icon': Icons.pets},
    {'title': 'Objects', 'icon': Icons.category},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn with AR'),
        centerTitle: true,
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
          return GestureDetector(
            onTap: () {
              // Later: Navigate to AR view
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
                    Text(category['title'], style: TextStyle(fontSize: 18)),
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