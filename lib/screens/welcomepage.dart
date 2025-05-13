import 'package:flutter/material.dart';
import 'homepage.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F1F1),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://plus.unsplash.com/premium_photo-1661255409375-687134ebcd0b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fEhlYWx0aCUyMG1hZ2F6aW5lfGVufDB8fDB8fHww",
                height: 200,
              ),
              const SizedBox(height: 30),
              const Text(
                'مرحبًا بك في المجلة الصحية',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Somar',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5A5A5A),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'اكتشف مقالات حول الصحة، التغذية، الجمال، واللياقة!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Somar',
                  color: Color(0xFF7A7A7A),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF79bde8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                  );
                },
                child: const Text(
                  'ابدأ الآن',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Somar',
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
