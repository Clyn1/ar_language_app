import 'package:flutter/material.dart';
import 'src/views/welcome_page.dart';
import 'src/views/home_page.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(),
        '/home': (context) => HomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
