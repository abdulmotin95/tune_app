import 'package:fine_tune_app/pages/setting_page.dart';
import 'package:flutter/material.dart';

import '../buttons/audio_button.dart';
import '../buttons/convert_button.dart';
import '../buttons/record_button.dart';
import '../buttons/trim_button.dart';
import '../buttons/video_button.dart';
import '../widget/feature_button.dart';
import 'file_page.dart';
import 'history_page.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF202020),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
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
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SettingsPage(),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.settings_outlined,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Image.asset(
                      'assets/images/e.png',
                      height: 200,
                      width: 200,
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Try to Noise Reducer',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Improve your working space by reducing\nambient noise',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF558C89),
                      ),
                    ),
                    const SizedBox(height: 24),
                    GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1,
                      children: [
                        FeatureButton(
                          title: 'Audio',
                          subtitle: 'Noise Reducer',
                          icon: Icons.mic,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const AudioPage()));
                          },
                        ),
                        FeatureButton(
                          title: 'Trim',
                          subtitle: 'Audio',
                          icon: Icons.content_cut,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const TrimPage()));
                          },
                        ),
                        FeatureButton(
                          title: 'Video',
                          subtitle: 'Noise Reducer',
                          icon: Icons.movie,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const VideoPage()));
                          },
                        ),
                        FeatureButton(
                          title: 'Convert',
                          subtitle: 'Audio',
                          icon: Icons.sync,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const ConvertPage()));
                          },
                        ),
                        FeatureButton(
                          title: 'Record',
                          subtitle: 'Audio',
                          icon: Icons.mic_none,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const RecordPage()));
                          },
                        ),
                        FeatureButton(
                          title: 'Record Plus',
                          subtitle: 'Noise Audio +',
                          icon: Icons.mic_none,
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomNavBar(context),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2E635F),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavBarItem(
            context: context,
            icon: Icons.home,
            isActive: true,
            onTap: () {},
          ),
          _buildNavBarItem(
            context: context,
            icon: Icons.description_outlined,
            isActive: false,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const FileManagerPage()));
            },
          ),
          _buildNavBarItem(
            context: context,
            icon: Icons.history,
            isActive: false,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const HistoryPage()));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNavBarItem({
    required BuildContext context,
    required IconData icon,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: isActive
            ? BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        )
            : null,
        child: Icon(icon, color: isActive ? Colors.white : Colors.white70, size: 28),
      ),
    );
  }
}