import 'package:flutter/material.dart';
import '../pages/home_page.dart';

class VideoImportPage extends StatelessWidget {
  const VideoImportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color cardColor = Color(0xFF2E3033);
    const Color primaryColor = Color(0xFF4EE382);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.0, -0.6),
            radius: 0.9,
            colors: [
              Color(0xFF2E635F),
              Color(0xFF202020),
            ],
            stops: [0.0, 1.0],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row
                Row(
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
                    const Text(
                      'Removing video Noise',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.settings, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // File Info Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Vid000_wave_recorder...Mp4',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'change',
                            style: TextStyle(color: primaryColor),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.refresh, color: Colors.grey),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Video Preview Box
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 60,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                color: Colors.transparent,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('00:00:00',
                                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                                  Text('00:04:23',
                                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Noise Type
                const Text(
                  'Select noise type',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    _buildNoiseChip('Speech Enhancement', isSelected: true),
                    _buildNoiseChip('Wind Noise'),
                    _buildNoiseChip('Reverb Noise'),
                    _buildNoiseChip('Denoise'),
                    _buildNoiseChip('Click Noise'),
                    _buildNoiseChip('Hiss Noise'),
                  ],
                ),

                const SizedBox(height: 20),

                // Sample Rate
                const Text(
                  'Sample rate',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text('44100 Hz',
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                      Icon(Icons.arrow_drop_down, color: Colors.white),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                _buildSliderSection('Input', Icons.mic, 67),
                const SizedBox(height: 20),
                _buildSliderSection('Noise', Icons.waves, 38),

                const SizedBox(height: 20),

                // Preview Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildPreviewButton('Original', Icons.play_arrow),
                    const SizedBox(width: 30),
                    _buildPreviewButton('Denoised', Icons.play_arrow,
                        denoised: true),
                  ],
                ),

                const SizedBox(height: 20),

                // Action Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text(
                      'Reduce noise now',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper Widgets
  Widget _buildNoiseChip(String text, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF4EE382) : const Color(0xFF2E3033),
        borderRadius: BorderRadius.circular(20),
        border: isSelected
            ? Border.all(color: Colors.transparent)
            : Border.all(color: Colors.grey),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: isSelected ? Colors.black : Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }

  Widget _buildSliderSection(String title, IconData icon, double value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 5),
            Text(title,
                style: const TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
        Slider(
          value: value,
          min: 0,
          max: 100,
          activeColor: const Color(0xFF4EE382),
          inactiveColor: const Color(0xFF3E4044),
          onChanged: (newValue) {},
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(value.toInt().toString(),
              style: const TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  Widget _buildPreviewButton(String text, IconData icon,
      {bool denoised = false}) {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2E3033),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        side: const BorderSide(color: Color(0xFF4EE382)),
      ),
      icon: Icon(icon, color: const Color(0xFF4EE382)),
      label: Text(text,
          style:
          TextStyle(color: denoised ? Colors.white : Colors.grey)),
    );
  }
}
