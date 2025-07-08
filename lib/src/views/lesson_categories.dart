import 'package:flutter/material.dart';

class LessonCategories extends StatelessWidget {
  final List<String> languages = ['Spanish', 'French', 'Swahili'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: languages.length,
      padding: EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(languages[index]),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Navigate to lesson screen
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Open ${languages[index]} lessons')),
              );
            },
          ),
        );
      },
    );
  }
}
