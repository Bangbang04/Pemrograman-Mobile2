import 'package:flutter/material.dart';
import 'pages/implicit_animation_page.dart';
import 'pages/explicit_animation_page.dart';
import 'pages/interactive_animation_page.dart';
import 'pages/transition_example_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/implicit': (context) => const ImplicitAnimationPage(),
        '/explicit': (context) => const ExplicitAnimationPage(),
        '/interactive': (context) => const InteractiveAnimationPage(),
        '/transition': (context) => const TransitionExamplePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animations & Transitions Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/implicit');
              },
              child: const Text('Implicit Animation'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/explicit');
              },
              child: const Text('Explicit Animation'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/transition');
              },
              child: const Text('Page Transition'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/interactive');
              },
              child: const Text('Interactive Animation'),
            ),
          ],
        ),
      ),
    );
  }
}