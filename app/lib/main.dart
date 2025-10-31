import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nonton Film Yuk',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'RobotoMono', // Pastikan sudah diatur di pubspec.yaml
        scaffoldBackgroundColor: const Color(0xFFF6F6F6),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nonton Film yuk'),
        centerTitle: false,
        backgroundColor: Colors.deepPurple.shade300,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Jangan Lupa Nonton Film di bioskop.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 12),
            Text(
              'karena banyak film baru dan seru untuk di tonton bareng keluarga,teman maupun pacar.',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Dan jangan merekan saat film sedang di tanyangkan.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Divider(height: 1, color: Colors.deepPurple),
            SizedBox(height: 20),
            Text(
              'Selamat menonton film favoritmu!',
              style: TextStyle(fontSize: 14, color: Colors.deepPurple),
            ),
          ],
        ),
      ),
    );
  }
}