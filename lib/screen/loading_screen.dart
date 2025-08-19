import 'package:flutter/material.dart';
import '../pages/home_page.dart';

class FineTuneLoadingScreen extends StatefulWidget {
  const FineTuneLoadingScreen({super.key});

  @override
  _FineTuneLoadingScreenState createState() => _FineTuneLoadingScreenState();
}

class _FineTuneLoadingScreenState extends State<FineTuneLoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();

    // After 3 seconds, go to HomePage
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191A1E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset('assets/images/lo.png', width: 100, height: 100),
            const SizedBox(height: 200),

            // Loading Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => FadeTransition(
                  opacity: Tween<double>(begin: 0.2, end: 1.0).animate(
                    CurvedAnimation(
                      parent: _controller,
                      curve: Interval(
                        0.25 * index,
                        (0.25 * index + 0.5).clamp(0.0, 1.0),
                        curve: Curves.easeIn,
                      ),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: 8.0,
                    height: 8.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // "Fine Tune" Text
            const Text(
              'Fine Tune',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),

            // Subtitle
            const Text(
              'Noise cancelling Reducer',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
