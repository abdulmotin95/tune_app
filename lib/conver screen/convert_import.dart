
import 'package:flutter/material.dart';

class ImportConvartPage extends StatelessWidget {
  const ImportConvartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color primaryGreen = Color(0xFF4EE382);
    const Color cardColor = Color(0xFF2E3033);
    const Color lightGrey = Color(0xFF99A0A5);

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
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Text(
                      'Convert',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const Icon(Icons.settings, color: Colors.white),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Vid000_wave_recorder...Mp4',
                        style: TextStyle(color: lightGrey)),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Change',
                            style: TextStyle(color: primaryGreen),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.refresh, color: lightGrey),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Icon(Icons.play_arrow, color: Colors.white, size: 60),
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('00:00:00',
                        style: TextStyle(color: lightGrey, fontSize: 12)),
                    Text('00:04:23',
                        style: TextStyle(color: lightGrey, fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 20),
                _buildOptionRow(
                  icon: Icons.play_arrow_outlined,
                  title: 'Format',
                  value: 'MP3',
                ),
                const SizedBox(height: 15),
                _buildSwitchOptionRow(
                  icon: Icons.expand_less,
                  title: 'Compress',
                  value: true,
                ),
                const SizedBox(height: 15),
                _buildOptionRow(
                  icon: Icons.volume_up,
                  title: 'Audio',
                  value: 'STEREO',
                ),
                const SizedBox(height: 15),
                _buildOptionRow(
                  icon: Icons.code,
                  title: 'Simple Rate',
                  value: '48000',
                ),
                const SizedBox(height: 15),
                _buildEncodingTypeRow(),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    icon: const Icon(Icons.download, color: Colors.black),
                    label: const Text(
                      'Export',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget _buildOptionRow(
      {required IconData icon, required String title, required String value}) {
    const Color primaryGreen = Color(0xFF4EE382);
    const Color cardColor = Color(0xFF2E3033);
    const Color lightGrey = Color(0xFF99A0A5);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(icon, color: primaryGreen),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Text(
            value,
            style: const TextStyle(color: lightGrey),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.arrow_forward_ios, color: lightGrey, size: 16),
        ],
      ),
    );
  }

  static Widget _buildSwitchOptionRow(
      {required IconData icon, required String title, required bool value}) {
    const Color primaryGreen = Color(0xFF4EE382);
    const Color cardColor = Color(0xFF2E3033);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(icon, color: primaryGreen),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Switch(
            value: value,
            onChanged: (newValue) {},
            activeColor: primaryGreen,
          ),
        ],
      ),
    );
  }

  static Widget _buildEncodingTypeRow() {
    const Color primaryGreen = Color(0xFF4EE382);
    const Color cardColor = Color(0xFF2E3033);
    const Color lightGrey = Color(0xFF99A0A5);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const Icon(Icons.headphones, color: primaryGreen),
          const SizedBox(width: 15),
          const Text(
            'Encoding Type :',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildRadioButton('CBR', isSelected: false),
                const SizedBox(width: 10),
                _buildRadioButton('VBR', isSelected: true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildRadioButton(String text, {required bool isSelected}) {
    const Color primaryGreen = Color(0xFF4EE382);
    const Color lightGrey = Color(0xFF99A0A5);

    return Row(
      children: [
        Radio<bool>(
          value: isSelected,
          groupValue: true,
          onChanged: (value) {},
          activeColor: primaryGreen,
        ),
        Text(
          text,
          style: TextStyle(color: isSelected ? primaryGreen : lightGrey),
        ),
      ],
    );
  }
}
