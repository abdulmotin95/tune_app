import 'package:flutter/material.dart';

class TrimPage extends StatelessWidget {
  const TrimPage({Key? key}) : super(key: key);

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
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Text('Trim', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    const Icon(Icons.settings, color: Colors.white),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Vid000_wave_recorder...Mp4',
                              style: TextStyle(color: lightGrey),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.cut, color: Colors.black),
                              label: const Text('Export', style: TextStyle(color: Colors.black)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryGreen,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: darkGrey,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                            child: Icon(Icons.play_arrow, color: Colors.white, size: 60),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildToggleChip('Audio', Icons.music_note, isSelected: true),
                            const SizedBox(width: 10),
                            _buildToggleChip('Video', Icons.videocam),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.play_arrow, color: primaryGreen, size: 35),
                            SizedBox(width: 15),
                            Text('00:00 | 04:21', style: TextStyle(color: Colors.white, fontSize: 16)),
                            SizedBox(width: 15),
                            Icon(Icons.undo, color: lightGrey, size: 35),
                            SizedBox(width: 15),
                            Icon(Icons.redo, color: lightGrey, size: 35),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildTrimOption('Split'),
                            _buildTrimOption('Trim', isSelected: true),
                            _buildTrimOption('No Noise'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: primaryGreen, width: 2),
                          ),
                          child: const Center(
                            child: Text('Timeline placeholder', style: TextStyle(color: lightGrey)),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text('♫ Tap to add music', style: TextStyle(color: lightGrey)),
                        const SizedBox(height: 20),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryGreen,
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                            ),
                            child: const Icon(Icons.cut, color: Colors.black, size: 30),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleChip(String text, IconData icon, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? primaryGreen : darkGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(icon, color: isSelected ? Colors.black : Colors.white),
          const SizedBox(width: 5),
          Text(text, style: TextStyle(color: isSelected ? Colors.black : Colors.white, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildTrimOption(String text, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        text,
        style: TextStyle(color: isSelected ? primaryGreen : lightGrey, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
