import 'package:flutter/material.dart';

class InteractiveAnimationPage extends StatefulWidget {
  const InteractiveAnimationPage({super.key});

  @override
  State<InteractiveAnimationPage> createState() =>
      _InteractiveAnimationPageState();
}

class _InteractiveAnimationPageState extends State<InteractiveAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;
  Offset _tapPosition = Offset.zero;
  Alignment _textAlignment = Alignment.center;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _scaleAnim = Tween<double>(begin: 1.0, end: 1.3).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _tapPosition = details.localPosition;

      // Randomly change position of "Tap Me"
      _textAlignment = Alignment(
        (details.localPosition.dx / MediaQuery.of(context).size.width) * 2 - 1,
        (details.localPosition.dy / MediaQuery.of(context).size.height) * 2 - 1,
      );
    });

    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  void _onTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Interactive Animation')),
      body: Stack(
        children: [
          // Tap position indicator
          Positioned(
            left: _tapPosition.dx - 20,
            top: _tapPosition.dy - 20,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Tap Me button
          AnimatedAlign(
            alignment: _textAlignment,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            child: GestureDetector(
              onTapDown: _onTapDown,
              onTapUp: _onTapUp,
              onTapCancel: _onTapCancel,
              child: ScaleTransition(
                scale: _scaleAnim,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Tap Me!",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}