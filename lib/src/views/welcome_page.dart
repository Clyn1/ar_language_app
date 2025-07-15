// lib/src/views/welcome_page.dart

import 'package:flutter/material.dart';
import 'home_page.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3E5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // 🎨 App Logo or Hero Image
              Expanded(
                child: Image.network(
                  'https://cdn-icons-png.flaticon.com/512/3135/3135789.png',
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 20),

              // 📛 App Name
              Text(
                'Language AR App',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 10),

              // ✨ Subtitle or Tagline
              Text(
                'Let’s learn through Augmented Reality!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              // 🚀 Get Started Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // Use named route so a back-arrow appears on HomePage
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
