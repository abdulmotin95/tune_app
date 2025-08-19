import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color primaryGreen = Color(0xFF4EE382);
    const Color cardColor = Color(0xFF2E3033);
    const Color lightGrey = Color(0xFF99A0A5);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2E635F), Color(0xFF202020)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/h.png',
                      height: 50,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Fine Tune',
                      style: TextStyle(
                        color: primaryGreen,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Noise cancelling Reducer',
                      style: TextStyle(
                        color: lightGrey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  children: [
                    _buildSettingItem(Icons.insert_drive_file, 'File Format', 'mp3'),
                    _buildSettingItem(Icons.view_agenda_outlined, 'Frame Rate', '144.1KHz'),
                    _buildSettingItem(Icons.policy, 'Privacy Policy'),
                    _buildSettingItem(Icons.folder, 'Storage Location', 'sd/finetune...'),
                    _buildSettingItem(Icons.settings, 'Settings'),
                    _buildSettingItem(Icons.help_outline, 'Help'),
                    _buildSettingItem(Icons.feedback_outlined, 'Feedback'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem(IconData icon, String title, [String? value]) {
    const Color primaryGreen = Color(0xFF4EE382);
    const Color cardColor = Color(0xFF2E3033);
    const Color lightGrey = Color(0xFF99A0A5);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const SizedBox(width: 15),
          Icon(icon, color: primaryGreen),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          if (value != null)
            Text(
              value,
              style: const TextStyle(color: lightGrey),
            ),
          const SizedBox(width: 10),
          const Icon(Icons.arrow_forward_ios, color: lightGrey, size: 16),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
