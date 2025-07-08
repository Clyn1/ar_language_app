import 'package:flutter/material.dart';
import 'src/views/welcome_page.dart';

void main() {
  runApp(LanguageARApp());
}

class LanguageARApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language AR App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
