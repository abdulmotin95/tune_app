import 'package:flutter/material.dart';
import '../buttons/audio_button.dart';

class ImportPage extends StatelessWidget {
  const ImportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191A1E),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(0.0, -0.6),
                  radius: 0.9,
                  colors: [Color(0xFF2E635F), Color(0xFF202020)],
                  stops: [0.0, 1.0],
                ),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTopBar(context),
                    const SizedBox(height: 16),
                    _buildSectionTitle('Origin'),
                    const SizedBox(height: 8),
                    _buildAudioWaveformCard(
                      'Ocean_wave_recorder...Mp3',
                      '00:00:23',
                      'Change',
                    ),
                    const SizedBox(height: 24),
                    _buildSectionTitle('Mods'),
                    const SizedBox(height: 8),
                    _buildChipButtons(),
                    const SizedBox(height: 24),
                    _buildDropdown('Sample rate', '44100 Hz'),
                    const SizedBox(height: 24),
                    _buildSliderRow('Input', 67, Icons.mic),
                    _buildSliderRow('Balance', 67, Icons.bar_chart),
                    _buildSliderRow('Effects', 67, Icons.bolt),
                    const SizedBox(height: 24),
                    _buildAudioWaveformCard(
                      '00:00:00',
                      '00:04:23',
                      'Edit',
                      showPlayButton: false,
                    ),
                    const SizedBox(height: 24),
                    _buildPlaybackControls(),
                    const SizedBox(height: 24),
                    Center(child: _buildActionButton('Reduce noise now')),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const AudioPage()),
            );
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 28),
        ),
        Row(
          children: const [
            Icon(Icons.waves, color: Color(0xFF2E635F), size: 20),
            SizedBox(width: 8),
            Text(
              'Removing Audio Noise',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings_outlined,
            color: Colors.white,
            size: 28,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildAudioWaveformCard(
      String title,
      String time,
      String buttonText, {
        bool showPlayButton = true,
      }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2E635F),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(color: Colors.white70)),
              Row(
                children: [
                  Text(time, style: const TextStyle(color: Colors.white70)),
                  const SizedBox(width: 8),
                  if (showPlayButton) ...[
                    const Icon(Icons.play_arrow, color: Colors.white),
                  ],
                  Text(
                    buttonText,
                    style: const TextStyle(color: Color(0xFF558C89)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChipButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildChip('Normal', isActive: true),
        _buildChip('Strong'),
        _buildChip('Extreme'),
      ],
    );
  }

  Widget _buildChip(String text, {bool isActive = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF2E635F) : const Color(0xFF202020),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF2E635F), width: 2),
      ),
      child: Text(
        text,
        style: TextStyle(color: isActive ? Colors.white : Colors.white70),
      ),
    );
  }

  Widget _buildDropdown(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(color: Colors.white)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF2E635F),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Text(value, style: const TextStyle(color: Colors.white)),
              const Icon(Icons.keyboard_arrow_down, color: Colors.white),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSliderRow(String title, int value, IconData icon) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: const Color(0xFF2E635F)),
            const SizedBox(width: 8),
            Text(title, style: const TextStyle(color: Colors.white)),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Slider(
                value: value.toDouble(),
                min: 0,
                max: 100,
                activeColor: const Color(0xFF2E635F),
                inactiveColor: const Color(0xFF202020),
                onChanged: (double newValue) {},
              ),
            ),
            Text(value.toString(), style: const TextStyle(color: Colors.white)),
          ],
        ),
      ],
    );
  }

  Widget _buildPlaybackControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildPlaybackButton(Icons.volume_up),
        _buildPlaybackButton(Icons.fast_rewind),
        _buildPlaybackButton(Icons.play_circle_fill, isLarge: true),
        _buildPlaybackButton(Icons.fast_forward),
        _buildPlaybackButton(Icons.replay),
      ],
    );
  }

  Widget _buildPlaybackButton(IconData icon, {bool isLarge = false}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2E635F),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: isLarge ? 50 : 30),
        onPressed: () {},
      ),
    );
  }

  Widget _buildActionButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF2E635F),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
