import 'package:flutter/material.dart';
import '../pages/home_page.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({Key? key}) : super(key: key);

  static const Color primaryGreen = Color(0xFF4EE382);
  static const Color lightGrey = Color(0xFF99A0A5);
  static const Color darkGrey = Color(0xFF2E3033);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2E635F),
              Color(0xFF202020),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const HomePage()),
                        );
                      },
                    ),
                    const Text('Noise Record', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    const Icon(Icons.settings, color: Colors.white),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.volume_up, color: Colors.black),
                      label: const Text('Noise Mood On', style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryGreen,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.volume_off, color: lightGrey),
                      label: const Text('Noise Mood Off', style: TextStyle(color: lightGrey)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darkGrey,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: primaryGreen.withOpacity(0.3), width: 8),
                      ),
                    ),
                    Container(
                      width: 220,
                      height: 220,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: primaryGreen.withOpacity(0.2), width: 5),
                      ),
                    ),
                    Icon(Icons.mic, size: 80, color: primaryGreen),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  const Text('Import File', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
                  const Text('Noise Reducer', style: TextStyle(color: lightGrey, fontSize: 14)),
                  const SizedBox(height: 20),
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: const Center(
                      child: Icon(Icons.play_arrow, color: Colors.white, size: 40),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('00:00:00', style: TextStyle(color: lightGrey, fontSize: 12)),
                        Text('00:00:00', style: TextStyle(color: lightGrey, fontSize: 12)),
                      ],
                    ),
                  ),
                  Slider(
                    value: 0.2,
                    activeColor: primaryGreen,
                    inactiveColor: darkGrey,
                    onChanged: (double value) {},
                  ),
                ],
              ),
              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}
